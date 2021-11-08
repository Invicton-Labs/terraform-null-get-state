// Get the raw state data
module "state" {
  source        = "Invicton-Labs/shell-data/external"
  version       = "0.2.1"
  command_unix  = "terraform show -json -no-color"
  working_dir   = var.working_dir != null ? var.working_dir : path.root
  fail_on_error = false
}

locals {
  no_state_file     = module.state.exitstatus != 0 && length(regexall("State management commands require a state file", module.state.stderr)) > 0
  state_file_locked = module.state.exitstatus != 0 && length(regexall("lock", module.state.stderr)) > 0
}

// Throw an error if it was a non-zero exit status AND it wasn't a "no state file" or "state file locked" error (each of which are handled separately)
module "assert_error_is_not_found" {
  source        = "Invicton-Labs/assertion/null"
  version       = "0.2.1"
  condition     = module.state.exitstatus == 0 || local.no_state_file || local.state_file_locked
  error_message = module.state.stderr
}

module "assert_error_is_locked" {
  source        = "Invicton-Labs/assertion/null"
  version       = "0.2.1"
  condition     = !local.state_file_locked
  error_message = "The state file is locked (this usually only occurs when using this module on Windows with a local backend). Try running terraform plan/apply with the -lock=false option."
}

locals {
  state_raw              = module.assert_error_is_not_found.checked && module.assert_error_is_locked.checked && module.state.exitstatus == 0 ? trimspace(module.state.stdout) : ""
  state_raw_with_default = local.state_raw == "" ? "{}" : local.state_raw
  // Decode the state, but wait for the assertion checks to be done and only use the real output if it was a 0 exit code (succeeded in loading the state)
  state_decoded = jsondecode(local.state_raw_with_default)
  // Merge it with an object that has fields of different types, so it forces it to be an object type, not a map type
  state_object = merge(local.state_decoded, {
    __conversion_field_string = ""
    __conversion_field_number = 0
  })
  values      = lookup(local.state_object, "values", {})
  root_module = lookup(local.values, "root_module", {})
  resources = [
    for resource in local.final_child.resources :
    merge({
      address  = "${resource.module_address}${resource.module_address != "" ? "." : ""}${resource.resource.mode == "data" ? "data." : ""}${resource.resource.type}.${resource.resource.name}"
      mode     = resource.resource.mode,
      type     = resource.resource.type,
      name     = resource.resource.name,
      module   = resource.module_address,
      provider = resource.resource.provider_name
      instance = merge({
        attributes = resource.resource.values
        },
        lookup(resource.resource, "index", null) != null ? { index_key = resource.resource.index } : {},
        {
          for k, v in resource.resource :
          k => v
          if !contains(["address", "index", "mode", "type", "name", "provider_name", "values"], k)
      })
    })
  ]
  resource_addresses = distinct([
    for resource in local.resources :
    resource.address
  ])
  resource_sets = {
    for address in local.resource_addresses :
    address => [
      for resource in local.resources :
      resource
      if resource.address == address
    ]
  }
  resources_instances_merged = {
    for address, resource_set in local.resource_sets :
    address => merge({
      for k, v in resource_set[0] :
      k => v
      if k != "instance"
      },
      {
        instances = [
          for resource in resource_set :
          resource.instance
        ]
    })
  }
  resources_only = {
    for address, resource in local.resources_instances_merged :
    address => resource
    if resource.mode == "managed"
  }
  data_only = {
    for address, resource in local.resources_instances_merged :
    address => resource
    if resource.mode == "data"
  }
}

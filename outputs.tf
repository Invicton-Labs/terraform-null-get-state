output "resources_and_datas" {
  description = "A list of all resources and data sources in the state."
  depends_on = [
    module.assert_error_is_not_found,
    module.assert_error_is_locked,
    module.assert_no_more_children
  ]
  value = local.no_state_file ? null : local.resources_instances_merged
}

output "resources" {
  description = "A list of all resources in the state."
  depends_on = [
    module.assert_error_is_not_found,
    module.assert_error_is_locked,
    module.assert_no_more_children
  ]
  value = local.no_state_file ? null : local.resources_only
}

output "datas" {
  description = "A list of all data sources in the state."
  depends_on = [
    module.assert_error_is_not_found,
    module.assert_error_is_locked,
    module.assert_no_more_children
  ]
  value = local.no_state_file ? null : local.data_only
}

output "outputs" {
  description = "A map of root module outputs, where keys are the output names and values are the output values."
  depends_on = [
    module.assert_error_is_not_found,
    module.assert_error_is_locked,
    module.assert_no_more_children
  ]
  value = local.no_state_file ? null : lookup(local.values, "outputs", {})
}

output "terraform_version" {
  description = "The version of Terraform that was used to create the state file."
  depends_on = [
    module.assert_error_is_not_found,
    module.assert_error_is_locked,
    module.assert_no_more_children
  ]
  value = local.no_state_file ? null : lookup(local.state_object, "terraform_version", null)
}

output "format_version" {
  description = "The version of the state file format."
  depends_on = [
    module.assert_error_is_not_found,
    module.assert_error_is_locked,
    module.assert_no_more_children
  ]
  value = local.no_state_file ? null : lookup(local.state_object, "format_version", null)
}

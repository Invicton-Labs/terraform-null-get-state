# Terraform Get State
Retrieves the current Terraform state (as it is during the plan step). The output format is intended to match the `terraform.tfstate` file as closely as possible, with the exception that it uses maps (with keys being fully qualified addresses) instead of lists of resources/datas.

You can also set the `working_dir` input parameter to the root directory of a *different* Terraform configuration. As long as proper credentials are set for that configuration without needing command-line arguments, it will be able to load the state file for that configuration.

This module is known to work with `s3` and `local` backends (for a `local` backend on Windows, you have to use the `-lock=false` flag for `terraform plan` and `terraform apply`). It *should* work with all other backends, but it has not been tested.

Usage:
```
data "local_file" "data_file" {
    filename = "${path.root}/hello.txt"
}

// Demo how the output shows single resources
resource "random_string" "resource_rand" {
    length = 8
}

// Demo how the output shows multiple instances of the same resource when using `count`
resource "random_uuid" "resource_rand_count" {
    count = 2
}

// Demo how the output shows multiple instances of the same resource when using `for_each`
resource "random_id" "resource_rand_for_each" {
    for_each = {"key1" = "", "key2" = ""}
    byte_length = 8
}

module "get_state" {
    source = "Invicton-Labs/get-state/null
}

output "state_resources" {
  value = module.get_state.resources
}

output "state_datas" {
  value = module.get_state.datas
}
```

Note that it will only find resources that are in the state before the new changes are applied. "Outputs" are also returned, but if you show the list of outputs in an output, you'll have a self-referencing loop that will grow on each apply.

First `terraform apply` run (nothing in the state yet):
```
Terraform will perform the following actions:

  # random_id.resource_rand_for_each["key1"] will be created
  + resource "random_id" "resource_rand_for_each" {
      + b64_std     = (known after apply)
      + b64_url     = (known after apply)
      + byte_length = 8
      + dec         = (known after apply)
      + hex         = (known after apply)
      + id          = (known after apply)
    }

  # random_id.resource_rand_for_each["key2"] will be created
  + resource "random_id" "resource_rand_for_each" {
      + b64_std     = (known after apply)
      + b64_url     = (known after apply)
      + byte_length = 8
      + dec         = (known after apply)
      + hex         = (known after apply)
      + id          = (known after apply)
    }

  # random_string.resource_rand will be created
  + resource "random_string" "resource_rand" {
      + id          = (known after apply)
      + length      = 8
      + lower       = true
      + min_lower   = 0
      + min_numeric = 0
      + min_special = 0
      + min_upper   = 0
      + number      = true
      + result      = (known after apply)
      + special     = true
      + upper       = true
    }

  # random_uuid.resource_rand_count[0] will be created
  + resource "random_uuid" "resource_rand_count" {
      + id     = (known after apply)
      + result = (known after apply)
    }

  # random_uuid.resource_rand_count[1] will be created
  + resource "random_uuid" "resource_rand_count" {
      + id     = (known after apply)
      + result = (known after apply)
    }

Plan: 5 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + state_datas     = {}
  + state_resources = {}

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

random_uuid.resource_rand_count[1]: Creating...
random_string.resource_rand: Creating...
random_id.resource_rand_for_each["key1"]: Creating...
random_id.resource_rand_for_each["key2"]: Creating...
random_uuid.resource_rand_count[1]: Creation complete after 0s [id=493c6c68-14f9-9c0e-bf43-156a2591ed9d]
random_uuid.resource_rand_count[0]: Creating...
random_string.resource_rand: Creation complete after 0s [id=t5joR$sG]
random_id.resource_rand_for_each["key2"]: Creation complete after 0s [id=Rk1tXjzzq_Q]
random_id.resource_rand_for_each["key1"]: Creation complete after 0s [id=bVVJ7FfWJF4]
random_uuid.resource_rand_count[0]: Creation complete after 0s [id=d1414899-155e-10a4-3eb0-a8f93ff25d84]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:

state_datas = {}
state_resources = {}
```

Second `terraform apply` run (no changes to the configuration, but datas/resources from the first run are now in the state):
```
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

state_datas = {
  "data.local_file.data_file" = {
    "address" = "local_file.data_file"
    "instances" = [
      {
        "attributes" = {
          "content" = <<-EOT
          Hello
          World!
          EOT
          "content_base64" = "SGVsbG8NCldvcmxkIQ=="
          "filename" = "./hello.txt"
          "id" = "aa50975ddb392d89ed95a840bd8036e3d350a120"
        }
        "schema_version" = 0
        "sensitive_values" = {}
      },
    ]
    "mode" = "data"
    "module" = ""
    "name" = "data_file"
    "provider" = "registry.terraform.io/hashicorp/local"
    "type" = "local_file"
  }
  ...
}

state_resources = {
  "random_id.resource_rand_for_each" = {
    "address" = "data.random_id.resource_rand_for_each"
    "instances" = [
      {
        "attributes" = {
          "b64_std" = "bVVJ7FfWJF4="
          "b64_url" = "bVVJ7FfWJF4"
          "byte_length" = 8
          "dec" = "7878284402589312094"
          "hex" = "6d5549ec57d6245e"
          "id" = "bVVJ7FfWJF4"
          "keepers" = null
          "prefix" = null
        }
        "index_key" = "key1"
        "schema_version" = 0
        "sensitive_values" = {}
      },
      {
        "attributes" = {
          "b64_std" = "Rk1tXjzzq/Q="
          "b64_url" = "Rk1tXjzzq_Q"
          "byte_length" = 8
          "dec" = "5065825407378631668"
          "hex" = "464d6d5e3cf3abf4"
          "id" = "Rk1tXjzzq_Q"
          "keepers" = null
          "prefix" = null
        }
        "index_key" = "key2"
        "schema_version" = 0
        "sensitive_values" = {}
      },
    ]
    "mode" = "managed"
    "module" = ""
    "name" = "resource_rand_for_each"
    "provider" = "registry.terraform.io/hashicorp/random"
    "type" = "random_id"
  }
  "random_string.resource_rand" = {
    "address" = "random_string.resource_rand"
    "instances" = [
      {
        "attributes" = {
          "id" = "t5joR$sG"
          "keepers" = null
          "length" = 8
          "lower" = true
          "min_lower" = 0
          "min_numeric" = 0
          "min_special" = 0
          "min_upper" = 0
          "number" = true
          "override_special" = null
          "result" = "t5joR$sG"
          "special" = true
          "upper" = true
        }
        "schema_version" = 1
        "sensitive_values" = {}
      },
    ]
    "mode" = "managed"
    "module" = ""
    "name" = "resource_rand"
    "provider" = "registry.terraform.io/hashicorp/random"
    "type" = "random_string"
  }
  "random_uuid.resource_rand_count" = {
    "address" = "random_uuid.resource_rand_count"
    "instances" = [
      {
        "attributes" = {
          "id" = "d1414899-155e-10a4-3eb0-a8f93ff25d84"
          "keepers" = null
          "result" = "d1414899-155e-10a4-3eb0-a8f93ff25d84"
        }
        "index_key" = 0
        "schema_version" = 0
        "sensitive_values" = {}
      },
      {
        "attributes" = {
          "id" = "493c6c68-14f9-9c0e-bf43-156a2591ed9d"
          "keepers" = null
          "result" = "493c6c68-14f9-9c0e-bf43-156a2591ed9d"
        }
        "index_key" = 1
        "schema_version" = 0
        "sensitive_values" = {}
      },
    ]
    "mode" = "managed"
    "module" = ""
    "name" = "resource_rand_count"
    "provider" = "registry.terraform.io/hashicorp/random"
    "type" = "random_uuid"
  }
}
```

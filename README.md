# Terraform Get State
Retrieves the current Terraform state (as it is during the plan step). The output format is intended to match the `terraform.tfstate` file as closely as possible.

You can also set the `working_dir` input parameter to the root directory of a *different* Terraform configuration. As long as proper credentials are set for that configuration without needing command-line arguments, it will be able to load the state file for that configuration.

This module is known to work with `s3` and `local` backends (for `local` on Windows, you have to use the `-lock=false` flag for `terraform plan` and `terraform apply`). It *should* work with all other backends, but it has not been tested.

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

module "get-state" {
    source = "Invicton-Labs/get-state/null
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
  + state_datas     = []
  + state_resources = []

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

random_uuid.resource_rand_count[0]: Creating...
random_id.resource_rand_for_each["key1"]: Creating...
random_uuid.resource_rand_count[1]: Creating...
random_string.resource_rand: Creating...
random_id.resource_rand_for_each["key2"]: Creating...
random_uuid.resource_rand_count[0]: Creation complete after 0s [id=6c9dfad7-08e4-f54b-6b5b-1f3aef7ddfe7]
random_uuid.resource_rand_count[1]: Creation complete after 0s [id=0b66d6fa-d106-bde0-ab30-7d5a73bc16c8]
random_id.resource_rand_for_each["key2"]: Creation complete after 0s [id=n8bkNYwm-bw]
random_string.resource_rand: Creation complete after 0s [id=oiTO:[f-]
random_id.resource_rand_for_each["key1"]: Creation complete after 0s [id=ems3kAV2IVU]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:

state_datas = []
state_resources = []
```

Second `terraform apply` run (no changes to the configuration, but datas/resources from the first run are now in the state):
```
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

state_datas = [
  {
    "instances" = [
      {
        "attributes" = {
          "content" = <<-EOT
          hello
          world
          EOT
          "content_base64" = "aGVsbG8NCndvcmxk"
          "filename" = "./hello.txt"
          "id" = "d07cff009c449bfdf131d865e1dc4413256e5f52"
        }
        "schema_version" = 0
        "sensitive_values" = {}
      },
    ]
    "mode" = "data"
    "name" = "data_file"
    "provider" = "registry.terraform.io/hashicorp/local"
    "type" = "local_file"
  },
]
state_resources = [
  {
    "instances" = [
      {
        "attributes" = {
          "b64_std" = "ems3kAV2IVU="
          "b64_url" = "ems3kAV2IVU"
          "byte_length" = 8
          "dec" = "8821205386841694549"
          "hex" = "7a6b379005762155"
          "id" = "ems3kAV2IVU"
          "keepers" = null
          "prefix" = null
        }
        "index_key" = "key1"
        "schema_version" = 0
        "sensitive_values" = {}
      },
      {
        "attributes" = {
          "b64_std" = "n8bkNYwm+bw="
          "b64_url" = "n8bkNYwm-bw"
          "byte_length" = 8
          "dec" = "11513140416055015868"
          "hex" = "9fc6e4358c26f9bc"
          "id" = "n8bkNYwm-bw"
          "keepers" = null
          "prefix" = null
        }
        "index_key" = "key2"
        "schema_version" = 0
        "sensitive_values" = {}
      },
    ]
    "mode" = "managed"
    "name" = "resource_rand_for_each"
    "provider" = "registry.terraform.io/hashicorp/random"
    "type" = "random_id"
  },
  {
    "instances" = [
      {
        "attributes" = {
          "id" = "oiTO:[f-"
          "keepers" = null
          "length" = 8
          "lower" = true
          "min_lower" = 0
          "min_numeric" = 0
          "min_special" = 0
          "min_upper" = 0
          "number" = true
          "override_special" = null
          "result" = "oiTO:[f-"
          "special" = true
          "upper" = true
        }
        "schema_version" = 1
        "sensitive_values" = {}
      },
    ]
    "mode" = "managed"
    "name" = "resource_rand"
    "provider" = "registry.terraform.io/hashicorp/random"
    "type" = "random_string"
  },
  {
    "instances" = [
      {
        "attributes" = {
          "id" = "6c9dfad7-08e4-f54b-6b5b-1f3aef7ddfe7"
          "keepers" = null
          "result" = "6c9dfad7-08e4-f54b-6b5b-1f3aef7ddfe7"
        }
        "index_key" = 0
        "schema_version" = 0
        "sensitive_values" = {}
      },
      {
        "attributes" = {
          "id" = "0b66d6fa-d106-bde0-ab30-7d5a73bc16c8"
          "keepers" = null
          "result" = "0b66d6fa-d106-bde0-ab30-7d5a73bc16c8"
        }
        "index_key" = 1
        "schema_version" = 0
        "sensitive_values" = {}
      },
    ]
    "mode" = "managed"
    "name" = "resource_rand_count"
    "provider" = "registry.terraform.io/hashicorp/random"
    "type" = "random_uuid"
  },
]
```
variable "working_dir" {
  description = "The directory of the root Terraform configuration files for the state that you'd like to retrieve. Defaults to the root of the current configuration (i.e. `path.root`)."
  type        = string
  default     = null
}

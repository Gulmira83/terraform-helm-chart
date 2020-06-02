## The name of the deployment
variable "deployment_name" {
  description = "(Required) The name of the deployment"
}

## The name of the environment
variable "deployment_environment" {
  description = "(Required) The name of the environment"
}

## Chart location or chart name
variable "deployment_path" {
  description = "(Required) Chart location or chart name <stable/example>"
}

## Endpoint for the application
variable "deployment_endpoint" {
  description = "(Required) Endpoint for the application"
}

variable "template_custom_vars" {
  type    = "map"
  default = {}
  description = "(Optional) A map of arbitrary strings to parse custom variables."
}

variable "env_vars" {
  type    = "map"
  default = {}
  description = "(Optional) A map of arbitrary strings to parse helm charts"
}

variable "trigger" {
  default = "UUID"
  description = "(Optional) A map of arbitrary strings that, when changed, will force the null resource to be replaced, re-running any associated provisioners."
}

variable "timeout" {
  default = "400"
  description = "(Optional) Time in seconds to wait for any individual kubernetes operation (like Jobs for hooks). Defaults to 300 seconds."
}

variable "recreate_pods" {
  default = false
  description = "(Optional) Perform pods restart during upgrade/rollback. Defaults to false"
}

## The name of the deployment
variable "deployment_name" {
  description = "- (Required) The name of the deployment"
}

## The name of the environment
variable "deployment_environment" {
  description = "- (Required) The name of the environment"
}

## Chart location or chart name
variable "deployment_path" {
  description = "- (Required) Chart location or chart name <stable/example>"
}

## Endpoint for the application
variable "deployment_endpoint" {
  description = "- (Required) Endpoint for the application"
}

variable "template_custom_vars" {
  type    = "map"
  default = {}
  description = "- (Optional) Used for custom variables inside your values.yaml"
}

variable "env_vars" {
  type    = "map"
  default = {}
  description = "- (Optional) Key, Value map for environment variables."
}

variable "trigger" {
  default = "UUID"
  description = "- (Optional) Used for internal trigger code."
}

variable "timeout" {
  default = "400"
  description = "- (Optional) By default timeout is <400>"
}

variable "recreate_pods" {
  default = false
  description = "- (Optional) Perform pods restart during upgrade/rollback. Defaults to false."
}
 variable "release_version" {
   description = "(Optional) Specify the exact chart version to install"
   default     = " 0.1.0"
 }

 variable "remote_chart" {
   default     = "false"
   description = "(Optional) If you are using remote chart make it <true>"
 }
 

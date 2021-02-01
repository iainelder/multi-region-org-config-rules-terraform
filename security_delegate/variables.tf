##########
# S3 Variables
##########
variable "encryption_enabled" {
  type        = bool
  default     = true
  description = "When set to 'true' the resource will have AES256 encryption enabled by default"
}

variable "primary_region" {
  type        = string
  default     = "eu-west-1"
  description = "Primary region used for condition with global resources for Config Rules."
}

variable "aggregator_name" {
  description = "Name of Config Aggregator"
  default = "organization-aggregator"
}

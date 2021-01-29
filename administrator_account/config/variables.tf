variable "config_role_name" {
  description = "Name of Organization Config Role"
  default = "OrganizationConfigRole"
}

variable "primary_region" {
  type        = string
  default     = "us-east-1"
  description = "Primary region used for condition with global resources for Config Rules."
}

##########
# S3 Variables
##########
variable "encryption_enabled" {
  type        = bool
  default     = true
  description = "When set to 'true' the resource will have AES256 encryption enabled by default"
}

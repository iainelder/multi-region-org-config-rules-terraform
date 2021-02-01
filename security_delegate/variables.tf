variable "primary_region" {
  type        = string
  default     = "eu-west-1"
  description = "Primary region used for condition with global resources for Config Rules."
}

variable "aggregator_name" {
  description = "Name of Config Aggregator"
  default = "organization-aggregator"
}

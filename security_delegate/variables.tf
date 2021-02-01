variable "region_to_record_global_events" {
  type        = string
  default     = "eu-west-1"
  description = "Region in which global events are recorded"
}

variable "aggregator_name" {
  description = "Name of Config Aggregator"
  default = "organization-aggregator"
}

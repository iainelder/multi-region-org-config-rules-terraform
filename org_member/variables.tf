variable region_to_record_global_events {
  default = "us-east-1"
}

variable "source_account_number" {
  description = "Enter master organization account"
  type        = string
}

variable "config_bucket_name" {
  type = string
}

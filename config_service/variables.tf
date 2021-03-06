variable "recorder_role_arn" {
  type = string
}

variable "region_to_record_global_events" {
  type        = string
  description = "Primary region used for condition with global resources for Config Rules."
}

variable bucket_name {
    type = string
    description = "The name of the Amazon S3 bucket to which AWS Config delivers configuration snapshots and configuration history files. "
}

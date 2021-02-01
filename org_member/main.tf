resource "aws_iam_service_linked_role" "configservice" {
  aws_service_name = "config.amazonaws.com"
}

module "us-east-1" {
  source = "../config_service"

  bucket_name = var.config_bucket_name
  region_to_record_global_events = var.region_to_record_global_events
  recorder_role_arn = aws_iam_service_linked_role.configservice.arn
  providers = {
    aws = aws.secondary-account-virginia
  }
}

module "us-east-2" {
  source = "../config_service"

  bucket_name = var.config_bucket_name
  region_to_record_global_events = var.region_to_record_global_events
  recorder_role_arn = aws_iam_service_linked_role.configservice.arn
  providers = {
    aws = aws.secondary-account-ohio
  }
}

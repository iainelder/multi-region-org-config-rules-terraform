provider "aws" {
  alias = "eu_west_1"
  region = "eu-west-1"
  profile = "saa-secdel-iam"
}

provider "aws" {
  alias = "us_east_1"
  region = "us-east-1"
  profile = "saa-secdel-iam"
}

# FIXME Make it so that eu-west-1 is the "main" region with the bucket, the
# global resources, and so on.
provider "aws" {
  region = "eu-west-1"
  profile = "saa-secdel-iam"
}

resource "aws_iam_service_linked_role" "configservice" {
  aws_service_name = "config.amazonaws.com"
}

module "config_bucket" {
  source = "./config_bucket"

  providers = {
    aws = aws.eu_west_1
  }
}

module "config_service_eu_west_1" {
  source = "../config_service"

  providers = {
    aws = aws.eu_west_1
  }

  bucket_name = module.config_bucket.bucket_name
  region_to_record_global_events = var.region_to_record_global_events
  recorder_role_arn = aws_iam_service_linked_role.configservice.arn
}

module "config_service_us_east_1" {
  source = "../config_service"

  providers = {
    aws = aws.us_east_1
  }

  bucket_name = module.config_bucket.bucket_name
  region_to_record_global_events = var.region_to_record_global_events
  recorder_role_arn = aws_iam_service_linked_role.configservice.arn
}

output "config_bucket_name" {
  value = module.config_bucket.bucket_name
}

output "config_aggregator_arn" {
    value = aws_config_configuration_aggregator.organization.arn 
    description = "AWS Config Aggregator ARN"
}

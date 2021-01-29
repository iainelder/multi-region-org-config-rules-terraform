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

module "config_bucket" {
  source = "./config_bucket"

  providers = {
    aws = aws.eu_west_1
  }

  encryption_enabled = var.encryption_enabled
}

module "config_service_eu_west_1" {
  source = "./config_service"

  providers = {
    aws = aws.eu_west_1
  }

  bucket_name = module.config_bucket.bucket_name
  primary_region = var.primary_region
  config_role_name = var.config_role_name
}

module "config_service_us_east_1" {
  source = "./config_service"

  providers = {
    aws = aws.us_east_1
  }

  bucket_name = module.config_bucket.bucket_name
  primary_region = var.primary_region
  config_role_name = var.config_role_name
}


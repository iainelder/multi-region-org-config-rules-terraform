module "us-east-1" {
  source = "./aggregation"

  source_account_number = var.source_account_number
  config_bucket_name = var.config_bucket_name
  providers = {
    aws = aws.secondary-account-virginia
  }
}

module "us-east-2" {
  source = "./aggregation"

  source_account_number = var.source_account_number
  config_bucket_name = var.config_bucket_name
  providers = {
    aws = aws.secondary-account-ohio
  }
}

module "iam" {
  source = "./aggregation/iam"

  providers = {
    aws = aws.secondary-account-virginia
  }
}
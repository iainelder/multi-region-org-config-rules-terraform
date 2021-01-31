# FIXME: Move all resources into modules to avoid having to set the default
# region.
provider aws {
  region = "eu-west-1" 
}

# FIXME: find a way to iterate over profiles from within Terraform.
provider aws {
  alias  = "secondary-account-virginia"
  region = "us-east-1" 
#  profile                 = "secondary_account"
}

provider aws {
  alias  = "secondary-account-ohio"
  region = "us-east-2"
#  profile                 = "secondary_account"
}

# Make sure to update the values to their intended value
# params:
# key: This will be the path of your Terraform state file
# bucket: The Amazon S3 bucket that the Terraform state file will be deployed to and referenced.
# region: The region of the S3 bucket
# dynamdb_table: The name of a DynamoDB table to use for state locking and consistency. The table must have a primary key named LockID. If not present, locking will be disabled.

terraform {
    backend "s3" {
        key            = "administrator.terraform.tfstate"
        bucket         = "terraformbackend-bucket-wmrjio8cem8n"
        region         = "eu-west-1"
        dynamodb_table = "TerraformBackend-Table-1OMF7F6CBQZ2P"
    }
}
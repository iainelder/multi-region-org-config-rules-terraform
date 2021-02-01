resource "aws_s3_bucket" "new_config_bucket" {
  bucket_prefix = "config-bucket"
  acl    = "private"
  force_destroy = true

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "general_block" {
  bucket = aws_s3_bucket.new_config_bucket.id
  block_public_acls = true
  block_public_policy = true
}

resource "aws_s3_bucket_policy" "config_logging_policy" {
  bucket = aws_s3_bucket.new_config_bucket.id
  policy = <<-POLICY
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "AWSConfigBucketPermissionsCheck",
          "Effect": "Allow",
          "Principal": {
            "Service": [
            "config.amazonaws.com"
            ]
          },
          "Action": "s3:GetBucketAcl",
          "Resource": "${aws_s3_bucket.new_config_bucket.arn}"
        },
        {
          "Sid": "AWSConfigBucketExistenceCheck",
          "Effect": "Allow",
          "Principal": {
            "Service": [
              "config.amazonaws.com"
            ]
          },
          "Action": "s3:ListBucket",
          "Resource": "${aws_s3_bucket.new_config_bucket.arn}"
        },
        {
          "Sid": "AWSConfigBucketDelivery",
          "Effect": "Allow",
          "Principal": {
            "Service": [
            "config.amazonaws.com"
            ]
          },
          "Action": "s3:PutObject",
          "Resource": "${aws_s3_bucket.new_config_bucket.arn}/AWSLogs/*",
          "Condition": {
            "StringEquals": {
              "s3:x-amz-acl": "bucket-owner-full-control"
            }
          }
        }
      ]
    }
    POLICY
}

output "bucket_name" {
  value = aws_s3_bucket.new_config_bucket.id
}

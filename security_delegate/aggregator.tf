resource "aws_config_configuration_aggregator" "organization" {
  name = var.aggregator_name

  organization_aggregation_source {
    all_regions = true
    role_arn    = aws_iam_role.org_agg.arn
  }
}

resource "aws_iam_role" "org_agg" {
  name = "AWSConfigRoleForOrganizations"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "config.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "org_agg_role" {
  role       = aws_iam_role.org_agg.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRoleForOrganizations"
}

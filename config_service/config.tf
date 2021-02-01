resource "aws_config_configuration_recorder_status" "config_recorder_status" {
  name       = aws_config_configuration_recorder.config_recorder.name
  is_enabled = true
  depends_on = [aws_config_delivery_channel.config_channel]
}

# Delivery channel resource and bucket location to specify configuration history location.
resource "aws_config_delivery_channel" "config_channel" {
  s3_bucket_name = var.bucket_name
  depends_on = [aws_config_configuration_recorder.config_recorder]
}


# -----------------------------------------------------------
# set up the Config Recorder
# -----------------------------------------------------------
resource "aws_config_configuration_recorder" "config_recorder" {
  role_arn = var.recorder_role_arn

  recording_group {
    all_supported                 = true
    include_global_resource_types = var.primary_region == data.aws_region.current.name ? true : false
  }
}

# Default stage log group
resource "aws_cloudwatch_log_group" "this" {
  count = var.create_default_stage_access_log_group ? 1 : 0

  name              = "${var.name}-logs"
  retention_in_days = var.default_stage_access_log_group_retention_in_days
  kms_key_id        = var.default_stage_access_log_group_kms_key_id
  skip_destroy      = var.default_stage_access_log_group_skip_destroy
  log_group_class   = var.default_stage_access_log_group_class

  tags = merge(var.tags, var.default_stage_access_log_group_tags)
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "${var.name}-ecs-logs"
  retention_in_days = var.log_retention
  kms_key_id        = null
  tags              = var.tags
}

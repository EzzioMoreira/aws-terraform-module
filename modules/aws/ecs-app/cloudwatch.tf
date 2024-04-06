resource "aws_cloudwatch_log_group" "this" {
  name              = "${var.container_definitions.name}-ecs-logs"
  retention_in_days = var.log_group
  kms_key_id        = null
  tags              = var.tags
}

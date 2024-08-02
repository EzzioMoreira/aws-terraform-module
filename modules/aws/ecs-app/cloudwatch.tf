locals {
  containers_with_awslogs = { for k, v in var.container_definitions : k => v if contains([for lc in [v.logConfiguration] : lc.logDriver], "awslogs") }
}

# Default stage log group
resource "aws_cloudwatch_log_group" "this" {
  for_each = local.containers_with_awslogs

  name              = "/ecs/${each.value.name}"
  retention_in_days = 7

  tags = merge(var.tags)
}

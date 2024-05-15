resource "aws_appautoscaling_target" "this" {
  count = var.create_autoscaling ? 1 : 0

  max_capacity       = var.autoscaling_app.max_capacity
  min_capacity       = var.autoscaling_app.min_capacity
  resource_id        = "service/${var.cluster_name}/${aws_ecs_service.this.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  lifecycle {
    ignore_changes = [
      max_capacity,
      min_capacity,
    ]
  }
}

resource "aws_appautoscaling_policy" "this" {
  count = var.create_autoscaling ? 1 : 0

  name               = "up-cpu-scaling-policy-${var.name}"
  policy_type        = "TargetTrackingScaling"
  resource_id        = aws_appautoscaling_target.this[0].resource_id
  scalable_dimension = aws_appautoscaling_target.this[0].scalable_dimension
  service_namespace  = aws_appautoscaling_target.this[0].service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }

    target_value = var.autoscaling_app.target
  }

  depends_on = [aws_appautoscaling_target.this]
}

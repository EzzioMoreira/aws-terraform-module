resource "aws_autoscaling_schedule" "down_schedule" {
  autoscaling_group_name = module.ecs_cluster.autoscaling_name
  scheduled_action_name  = "scale-down"
  desired_capacity       = 0
  min_size               = 0
  max_size               = 0
  start_time             = "2024-06-05T23:00:00Z" # Hora UTC (0:00)
  recurrence             = "0 23 * * MON-FRI"     # Executar às 23:00 UTC, de segunda a sexta-feira
  lifecycle {
    ignore_changes = [start_time]
  }
}

resource "aws_autoscaling_schedule" "up_schedule" {
  autoscaling_group_name = module.ecs_cluster.autoscaling_name
  scheduled_action_name  = "scale-up"
  desired_capacity       = 2
  min_size               = 2
  max_size               = 2
  start_time             = "2024-07-18T09:00:00Z" # Hora UTC (0:00)
  recurrence             = "0 9 * * MON-FRI"      # Executar às 09:00 UTC, de segunda a sexta-feira
  lifecycle {
    ignore_changes = [start_time]
  }
}

resource "aws_autoscaling_group" "this" {
  name_prefix               = local.environment[terraform.workspace].autoscaling.name_prefix
  availability_zones        = ["us-east-1a", "us-east-1b", "us-east-1c"]
  min_size                  = local.environment[terraform.workspace].autoscaling.min_size
  max_size                  = local.environment[terraform.workspace].autoscaling.max_size
  desired_capacity          = local.environment[terraform.workspace].autoscaling.desired_size
  health_check_grace_period = 0
  health_check_type         = "EC2"
  protect_from_scale_in     = true
  enabled_metrics = [
    "GroupMinSize",
    "GroupMaxSize",
    "GroupDesiredCapacity",
    "GroupInServiceInstances",
    "GroupPendingInstances",
    "GroupStandbyInstances",
    "GroupTerminatingInstances",
    "GroupTotalInstances"
  ]

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = local.tags.Name
    propagate_at_launch = true
  }

  tag {
    key                 = "env"
    value               = local.tags.env
    propagate_at_launch = true
  }

  tag {
    key                 = "service"
    value               = local.tags.service
    propagate_at_launch = true
  }

  tag {
    key                 = "team"
    value               = local.tags.team
    propagate_at_launch = true
  }

  tag {
    key                 = "repository"
    value               = local.tags.repository
    propagate_at_launch = true
  }

  tag {
    key                 = "documentation"
    value               = local.tags.documentation
    propagate_at_launch = true
  }

  tag {
    key                 = "created"
    value               = local.tags.created
    propagate_at_launch = true
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = "true"
    propagate_at_launch = true
  }
}

resource "aws_ecs_capacity_provider" "this" {
  name = "${local.cluster_name}-capacity-provider"

  auto_scaling_group_provider {
    auto_scaling_group_arn         = aws_autoscaling_group.this.arn
    managed_termination_protection = "ENABLED"

    managed_scaling {
      maximum_scaling_step_size = 1000
      minimum_scaling_step_size = 1
      status                    = "ENABLED"
      target_capacity           = 3
    }
  }
  tags = local.tags
}

resource "aws_ecs_cluster_capacity_providers" "this" {
  cluster_name = aws_ecs_cluster.this.name

  capacity_providers = [aws_ecs_capacity_provider.this.name]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = aws_ecs_capacity_provider.this.name
  }
}

resource "aws_autoscaling_schedule" "down_schedule" {
  autoscaling_group_name = aws_autoscaling_group.this.name
  scheduled_action_name  = "scale-down"
  desired_capacity       = 0
  min_size               = 0
  max_size               = 0
  start_time             = "2024-04-02T23:00:00Z" # Hora UTC (0:00)
  recurrence             = "0 23 * * MON-FRI"     # Executar às 23:00 UTC, de segunda a sexta-feira
}

resource "aws_autoscaling_schedule" "up_schedule" {
  autoscaling_group_name = aws_autoscaling_group.this.name
  scheduled_action_name  = "scale-up"
  desired_capacity       = 1
  min_size               = 1
  max_size               = 1
  start_time             = "2024-04-03T08:00:00Z" # Hora UTC (0:00)
  recurrence             = "0 9 * * MON-FRI"      # Executar às 09:00 UTC, de segunda a sexta-feira
}

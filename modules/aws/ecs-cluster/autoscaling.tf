resource "aws_autoscaling_group" "this" {
  name_prefix               = "ecs-cluster-${var.cluster_name}-asg"
  force_delete              = true
  vpc_zone_identifier       = var.subnet_ids
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_size
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
    value               = "ecs-cluster-${var.cluster_name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "env"
    value               = var.tags.env
    propagate_at_launch = true
  }

  tag {
    key                 = "service"
    value               = var.tags.service
    propagate_at_launch = true
  }

  tag {
    key                 = "team"
    value               = var.tags.team
    propagate_at_launch = true
  }

  tag {
    key                 = "repository"
    value               = var.tags.repository
    propagate_at_launch = true
  }

  tag {
    key                 = "documentation"
    value               = var.tags.documentation
    propagate_at_launch = true
  }

  tag {
    key                 = "created"
    value               = var.tags.created
    propagate_at_launch = true
  }

  tag {
    key                 = "AmazonECSManaged"
    value               = "true"
    propagate_at_launch = true
  }
}

resource "aws_ecs_capacity_provider" "this" {
  name = "cluster-${var.cluster_name}-capacity-provider"

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
  tags = var.tags
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

resource "aws_iam_role" "this" {
  name               = "ecs-ec2-role-cluster-${var.cluster_name}"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_instance_profile" "this" {
  name = "ecs-ec2-cluster-${var.cluster_name}-profile"
  role = aws_iam_role.this.name
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

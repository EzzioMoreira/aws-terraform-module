resource "aws_ecs_service" "this" {
  name            = var.name
  cluster         = var.cluster_name
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = var.desired_count
  launch_type     = "EC2"

  network_configuration {
    subnets          = var.subnets
    assign_public_ip = var.assign_public_ip
    security_groups  = var.security_groups
  }

  dynamic "load_balancer" {
    for_each = toset(var.load_balancer == null ? [] : [var.load_balancer])

    content {
      target_group_arn = load_balancer.value.target_group_arn
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
    }
  }
  tags = var.tags
}

resource "aws_ecs_task_definition" "this" {
  family                   = var.name
  requires_compatibilities = ["EC2"]
  network_mode             = "awsvpc"
  execution_role_arn       = var.execution_role_arn

  container_definitions = jsonencode([
    for _, container in var.container_definitions : {
      name         = container.name
      image        = container.image
      cpu          = container.cpu
      memory       = container.memory
      essential    = container.essential
      portMappings = container.port_mappings
      environment  = container.environment_variables
      secrets      = container.secrets
      expose       = container.expose

      health_check = try(container.health_check, {})

      log_configuration = {
        log_driver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.this.name
          "awslogs-region"        = data.aws_region.current.name
          "awslogs-stream-prefix" = container.name
        }
      }
    }
  ])

  tags = var.tags
}

resource "aws_ecs_service" "this" {
  name                = var.name
  cluster             = var.cluster_name
  task_definition     = aws_ecs_task_definition.this.arn
  desired_count       = var.desired_count
  launch_type         = "EC2"
  scheduling_strategy = var.scheduling_strategy


  dynamic "service_connect_configuration" {
    for_each = length(var.service_connect_configuration) > 0 ? [var.service_connect_configuration] : []

    content {
      enabled = try(service_connect_configuration.value.enabled, true)

      dynamic "log_configuration" {
        for_each = try([service_connect_configuration.value.log_configuration], [])

        content {
          log_driver = try(log_configuration.value.log_driver, null)
          options    = try(log_configuration.value.options, null)

          dynamic "secret_option" {
            for_each = try(log_configuration.value.secret_option, [])

            content {
              name       = secret_option.value.name
              value_from = secret_option.value.value_from
            }
          }
        }
      }

      namespace = lookup(service_connect_configuration.value, "namespace", null)

      dynamic "service" {
        for_each = try([service_connect_configuration.value.service], [])

        content {

          dynamic "client_alias" {
            for_each = try([service.value.client_alias], [])

            content {
              dns_name = try(client_alias.value.dns_name, null)
              port     = client_alias.value.port
            }
          }

          discovery_name        = try(service.value.discovery_name, null)
          ingress_port_override = try(service.value.ingress_port_override, null)
          port_name             = service.value.port_name
        }
      }
    }
  }



  dynamic "load_balancer" {
    for_each = var.load_balancer

    content {
      target_group_arn = load_balancer.value.target_group_arn
      container_name   = load_balancer.value.container_name
      container_port   = load_balancer.value.container_port
    }
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      task_definition,
    ]
  }
}

resource "aws_ecs_task_definition" "this" {
  family                   = var.name
  requires_compatibilities = ["EC2"]
  network_mode             = var.network_mode
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.execution_role_arn

  dynamic "volume" {
    for_each = var.volume != null ? toset(var.volume) : []

    content {
      name      = volume.value.name
      host_path = volume.value.host_path
    }
  }

  container_definitions = jsonencode([
    for _, container in var.container_definitions : {
      name                  = container.name
      image                 = container.image
      cpu                   = container.cpu
      memory                = container.memory
      essential             = container.essential
      portMappings          = container.port_mappings
      environment           = container.environment_variables
      secrets               = container.secrets
      expose                = container.expose
      healthCheck           = try(container.health_check, {})
      privileged            = var.privileged
      user                  = container.user
      mountPoints           = container.mountPoints
      logConfiguration      = container.logConfiguration
      firelensConfiguration = container.firelensConfiguration
      command               = container.command
    }
  ])

  tags = var.tags
}

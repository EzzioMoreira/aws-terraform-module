####################################################################################################
### ECS Cluster Development ###
####################################################################################################

module "ecs_cluster_development" {
  source = "../../../modules/aws/ecs-cluster"

  cluster_name    = "development"
  min_size        = 1
  max_size        = 1
  desired_size    = 1
  instance_type   = "t3a.small"
  instance_market = "spot"

  tags = {
    env           = "development"
    service       = "ecs-cluster"
    team          = "devops"
    repository    = "drcash-brazil/drcash_platform_infrastructure"
    documentation = "null"
    created       = "terraform"
  }
}

resource "aws_autoscaling_schedule" "down_schedule" {
  autoscaling_group_name = module.ecs_cluster_development.autoscaling_name
  scheduled_action_name  = "scale-down"
  desired_capacity       = 0
  min_size               = 0
  max_size               = 0
  start_time             = "2024-04-04T23:00:00Z" # Hora UTC (0:00)
  recurrence             = "0 23 * * MON-FRI"     # Executar às 23:00 UTC, de segunda a sexta-feira
  
}

resource "aws_autoscaling_schedule" "up_schedule" {
  autoscaling_group_name = module.ecs_cluster_development.autoscaling_name
  scheduled_action_name  = "scale-up"
  desired_capacity       = 1
  min_size               = 1
  max_size               = 1
  start_time             = "2024-04-05T08:00:00Z" # Hora UTC (0:00)
  recurrence             = "0 9 * * MON-FRI"      # Executar às 09:00 UTC, de segunda a sexta-feira
  lifecycle {
    ignore_changes = [ start_time ]
  }
}

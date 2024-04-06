locals {
  cluster_name  = "tools"
  instance_type = "t3a.small"
  autoscaling = {
    min_size     = 1
    max_size     = 1
    desired_size = 1
  }

  tags = {
    env           = "productions"
    service       = "ecs-cluster"
    team          = "devops"
    repository    = "drcash-brazil/drcash_platform_infrastructure"
    documentation = "null"
    created       = "terraform"
  }
}

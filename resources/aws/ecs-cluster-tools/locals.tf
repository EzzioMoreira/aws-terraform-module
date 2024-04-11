locals {
  cluster_name  = "tools"
  instance_type = "t3a.small"
  autoscaling = {
    min_size     = 1
    max_size     = 1
    desired_size = 1
  }
  certificate_arn = "arn:aws:acm:us-east-1:852704159394:certificate/d40fd5a3-353e-4334-8b67-39b5d9f62a95"

  tags = {
    env           = "productions"
    service       = "ecs-cluster"
    team          = "devops"
    repository    = "drcash-brazil/drcash_platform_infrastructure"
    documentation = "null"
    created       = "terraform"
  }
}

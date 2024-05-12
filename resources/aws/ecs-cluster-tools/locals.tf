locals {
  cluster_name = "tools"
  autoscaling = {
    min_size     = 3
    desired_size = 3
    max_size     = 6
  }
  autoscaling_instace_type = [
    {
      instance_type     = "t4g.medium" # 2 vCPU, 4 GiB
      weighted_capacity = 1
    },
    {
      instance_type     = "t4g.xlarge" # 4 vCPU, 16 GiB
      weighted_capacity = 2
  }]
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

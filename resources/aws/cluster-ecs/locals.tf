locals {
  environment = {
    default = {}
    development = {
      autoscaling = {
        name_prefix     = "drcash-ecs-asg-main-api-dev"
        min_size        = 1
        max_size        = 2
        desired_size    = 1
        instance_type   = "t3a.small"
        instance_market = "spot"
      }
    }
  }
  cluster_name = "drcash-cluster-${terraform.workspace}"
  tags = {
    Name          = "drcash-cluster-${terraform.workspace}"
    env           = "${terraform.workspace}"
    service       = "terraform"
    team          = "infrastructure"
    repository    = "drcash-brazil/drcash_platform_infrastructure"
    documentation = "null"
    created       = "terraform"
  }
}

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

locals {
  environment = {
    development = {
      # atributos do cluster
      cluster_name = "development"
      min_size     = 1
      max_size     = 1
      desired_size = 1
      instance_market = "spot"
      instance_type = "t3a.small"
      
      # atributos do loadbalance
      loadbalance_type = "application"
      internal         = false
    }
  }
  

  # tags para recursos
  tags = {
    env           = "development"
    service       = "ecs-cluster"
    team          = "devops"
    repository    = "drcash-brazil/drcash_platform_infrastructure"
    documentation = "https://notion.so/drcash/Infraestrutura-como-C-digo"
    created       = "terraform"
  }
}

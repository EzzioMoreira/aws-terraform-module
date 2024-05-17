locals {
  environment = {
    development = {
      # atributos do cluster
      cluster_name    = "development"
      min_size        = 2
      max_size        = 2
      desired_size    = 2

      autoscaling_instance_types = [{
        instance_type     = "t3.micro"
        weighted_capacity = 1
        },
        {
          instance_type     = "t3.small"
          weighted_capacity = 2
      }]
      on_demand_percentage_above_base_capacity = 100 # 100% de instâncias sob demanda
      spot_allocation_strategy                 = "lowest-price" # menor preço
      spot_instance_pools                      = 2 # quantidade de instance stop por AZ

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

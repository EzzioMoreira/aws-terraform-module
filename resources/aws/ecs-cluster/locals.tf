locals {
  environment = {
    development = {
      # atributos do cluster
      cluster_name = "development"
      min_size     = 1
      max_size     = 2
      desired_size = 2

      autoscaling_instance_types = [{
        instance_type     = "t3a.small"
        weighted_capacity = 1
        },
        {
          instance_type     = "t3a.medium"
          weighted_capacity = 2
      }]
      on_demand_percentage_above_base_capacity = 100            # 100% de instâncias sob demanda
      spot_allocation_strategy                 = "lowest-price" # menor preço
      spot_instance_pools                      = 2              # quantidade de instance stop por AZ

      # atributos do loadbalance
      loadbalance = {
        private = {
          type     = "application"
          internal = true
          subnets  = data.aws_subnets.private.ids
        }
        public = {
          type     = "application"
          internal = false
          subnets  = data.aws_subnets.public.ids
        }
      }
    }

    staging = {
      # atributos do cluster
      cluster_name = "staging"
      min_size     = 1
      max_size     = 2
      desired_size = 2

      autoscaling_instance_types = [{
        instance_type     = "t3a.small"
        weighted_capacity = 1
        },
        {
          instance_type     = "t3a.medium"
          weighted_capacity = 2
      }]
      on_demand_percentage_above_base_capacity = 50             # 100% de instâncias sob demanda
      spot_allocation_strategy                 = "lowest-price" # menor preço
      spot_instance_pools                      = 1              # quantidade de instance stop por AZ

      # atributos do loadbalance
      loadbalance = {
        private = {
          type     = "application"
          internal = true
          subnets  = data.aws_subnets.private.ids
        }
        public = {
          type     = "application"
          internal = false
          subnets  = data.aws_subnets.public.ids
        }
      }
    }

    production = {
      # atributos do cluster
      cluster_name = "production"
      min_size     = 1
      max_size     = 2
      desired_size = 2

      autoscaling_instance_types = [{
        instance_type     = "t3a.small"
        weighted_capacity = 1
        },
        {
          instance_type     = "t3a.medium"
          weighted_capacity = 2
      }]
      on_demand_percentage_above_base_capacity = 50             # 100% de instâncias sob demanda
      spot_allocation_strategy                 = "lowest-price" # menor preço
      spot_instance_pools                      = 1              # quantidade de instance stop por AZ

      # atributos do loadbalance
      loadbalance = {
        private = {
          type     = "application"
          internal = true
          subnets  = data.aws_subnets.private.ids
        }
        public = {
          type     = "application"
          internal = false
          subnets  = data.aws_subnets.public.ids
        }
      }
    }
  }


  # tags para recursos
  tags = {
    env           = "${terraform.workspace}"
    service       = "ecs-cluster"
    team          = "devops"
    repository    = "rapadura-brazil/rapadura_platform_infrastructure"
    documentation = "https://notion.so/rapadura/Infraestrutura-como-C-digo"
    created       = "terraform"
  }
}

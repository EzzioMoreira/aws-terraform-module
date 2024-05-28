####################################################################################################
### ECS Cluster Development ###
####################################################################################################

module "ecs_cluster" {
  source = "../../../modules/aws/ecs-cluster"

  cluster_name                             = local.environment[terraform.workspace].cluster_name
  min_size                                 = local.environment[terraform.workspace].min_size
  max_size                                 = local.environment[terraform.workspace].max_size
  desired_size                             = local.environment[terraform.workspace].desired_size
  autoscaling_instace_type                 = local.environment[terraform.workspace].autoscaling_instance_types
  on_demand_percentage_above_base_capacity = local.environment[terraform.workspace].on_demand_percentage_above_base_capacity
  spot_allocation_strategy                 = local.environment[terraform.workspace].spot_allocation_strategy
  spot_instance_pools                      = local.environment[terraform.workspace].spot_instance_pools

  tags = local.tags
}


####################################################################################################
### Loadbalance Development ###
####################################################################################################

module "loadbalance" {
  source = "../../../modules/aws/loadbalance"

  name               = local.environment[terraform.workspace].cluster_name
  type               = local.environment[terraform.workspace].loadbalance_type
  internal           = local.environment[terraform.workspace].internal
  subnet_ids         = data.aws_subnets.public.ids
  security_group_ids = [aws_security_group.this.id]

  tags = local.tags
}

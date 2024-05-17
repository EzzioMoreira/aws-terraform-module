####################################################################################################
### ECS Cluster Development ###
####################################################################################################

module "ecs_cluster_development" {
  source = "../../../modules/aws/ecs-cluster"

  cluster_name    = local.environment[terraform.workspace].cluster_name
  min_size        = local.environment[terraform.workspace].min_size
  max_size        = local.environment[terraform.workspace].max_size
  desired_size    = local.environment[terraform.workspace].desired_size
  instance_market = local.environment[terraform.workspace].instance_market

  autoscaling_instace_type = [ {
    instance_type = local.environment[terraform.workspace].instance_type
    weighted_capacity = 1
  } ]

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
  
  tags               = local.tags
}

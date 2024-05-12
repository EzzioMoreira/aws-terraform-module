####################################################################################################
### ECS Cluster tools ###
####################################################################################################

module "ecs_cluster" {
  source = "../../../modules/aws/ecs-cluster"

  cluster_name = local.cluster_name
  min_size     = local.autoscaling.min_size
  max_size     = local.autoscaling.max_size
  desired_size = local.autoscaling.desired_size
  autoscaling_instace_type = [{
    instance_type     = local.autoscaling_instace_type[0].instance_type
    weighted_capacity = local.autoscaling_instace_type[0].weighted_capacity
    },
    {
      instance_type     = local.autoscaling_instace_type[1].instance_type
      weighted_capacity = local.autoscaling_instace_type[1].weighted_capacity
  }]

  tags = local.tags
}


####################################################################################################
### Loadbalance tools ###
####################################################################################################
module "loadbalance" {
  source = "../../../modules/aws/loadbalance"

  name               = "${local.cluster_name}-internal"
  type               = "application"
  internal           = true
  subnet_ids         = data.aws_subnets.private.ids
  security_group_ids = [aws_security_group.this.id]
  tags               = local.tags
}

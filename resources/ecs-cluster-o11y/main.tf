####################################################################################################
### ECS Cluster o11y ###
####################################################################################################

module "ecs_cluster" {
  source = "github.com/EzzioMoreira/aws-terraform-module//modules/ecs-cluster?ref=v0.0.1-ecs-cluster-alb"

  cluster_name  = local.cluster_name
  min_size      = local.autoscaling.min_size
  max_size      = local.autoscaling.max_size
  desired_size  = local.autoscaling.desired_size
  instance_type = local.instance_type
  vpc_id        = local.vpc_id

  tags = local.tags
}


####################################################################################################
### Loadbalance o11y ###
####################################################################################################
module "loadbalance" {
  source = "github.com/EzzioMoreira/aws-terraform-module//modules/loadbalance?ref=v0.0.1-ecs-cluster-alb"

  name               = "${local.cluster_name}-internal"
  type               = "application"
  internal           = true
  subnet_ids         = data.aws_subnets.private.ids
  security_group_ids = [aws_security_group.this.id]
  tags               = local.tags
}

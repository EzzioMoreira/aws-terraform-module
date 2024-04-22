####################################################################################################
### ECS Cluster tools ###
####################################################################################################

module "ecs_cluster" {
  source = "../../../modules/aws/ecs-cluster"

  cluster_name  = local.cluster_name
  min_size      = local.autoscaling.min_size
  max_size      = local.autoscaling.max_size
  desired_size  = local.autoscaling.desired_size
  instance_type = local.instance_type

  tags = local.tags
}


####################################################################################################
### Loadbalance tools ###
####################################################################################################

resource "aws_lb_target_group" "https" {
  name        = "${module.ecs_cluster.ecs_cluster.cluster_name}-https"
  port        = 443
  protocol    = "HTTPS"
  target_type = "ip"
  vpc_id      = module.ecs_cluster.vpc_id
}

module "loadbalance" {
  source = "../../../modules/aws/loadbalance"

  name               = local.cluster_name
  type               = "application"
  internal           = false
  subnet_ids         = data.aws_subnets.public.ids
  security_group_ids = [aws_security_group.this.id]
  tags               = local.tags

  listeners = {
    https = {
      port                     = "443"
      protocol                 = "HTTPS"
      default_target_group_arn = aws_lb_target_group.https.arn
      ssl_policy               = "ELBSecurityPolicy-TLS13-1-2-2021-06"
      certificate_arn          = local.certificate_arn
    }
  }
}

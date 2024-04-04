####################################################################################################
### ECS Cluster Development ###
####################################################################################################

module "ecs_cluster_development" {
  source = "../../../modules/aws/ecs-cluster"

  cluster_name    = "development"
  min_size        = 1
  max_size        = 1
  desired_size    = 1
  instance_type   = "t3a.small"
  instance_market = "spot"

  tags = local.tags
}


####################################################################################################
### Loadbalance Development ###
####################################################################################################

resource "aws_lb_target_group" "http" {
  name        = "http"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = module.ecs_cluster_development.vpc_id
}

module "loadbalance" {
  source = "../../../modules/aws/loadbalance"

  name               = "development"
  type               = "application"
  internal           = false
  subnet_ids         = data.aws_subnets.private.ids
  security_group_ids = [aws_security_group.this.id]
  tags               = local.tags

  listeners = {
    http = {
      port                     = "80"
      protocol                 = "HTTP"
      default_target_group_arn = aws_lb_target_group.http.arn
    }
  }
}
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [module.ecs_cluster_development.vpc_id]
  }

  filter {
    name   = "availability-zone"
    values = ["us-east-1a", "us-east-1b", "us-east-1c"]
  }

  tags = {
    tier = "private"
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [module.ecs_cluster.vpc_id]
  }

  filter {
    name   = "availability-zone"
    values = ["us-east-1a", "us-east-1b", "us-east-1c"]
  }

  tags = {
    tier = "private"
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [module.ecs_cluster.vpc_id]
  }

  filter {
    name   = "availability-zone"
    values = ["us-east-1a", "us-east-1b", "us-east-1c"]
  }

  tags = {
    tier = "public"
  }
}

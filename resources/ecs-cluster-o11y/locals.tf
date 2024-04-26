locals {
  cluster_name  = "o11y"
  instance_type = "t3a.medium"
  vpc_id        = "vpc-0b95a372313f6516d"
  autoscaling = {
    min_size     = 1
    max_size     = 1
    desired_size = 1
  }

  tags = {
    env              = "prod"
    service          = "observability"
    team             = "sre"
    repository       = "ezziomoreira/aws-terraform-modules"
    documentation    = "null"
    created_by       = "terraform"
  }
}

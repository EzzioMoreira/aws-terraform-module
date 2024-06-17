data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = ["vpc-0fdcf082b368d1f78"]
  }

  filter {
    name   = "availability-zone"
    values = ["us-east-1a", "us-east-1b", "us-east-1c"]
  }

  tags = {
    tier = "private"
  }
}

data "aws_ami" "this" {
  most_recent = true
  owners      = ["591542846629"] # account id for Amazon

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-kernel-5*x86_64-ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  filter {
    name   = "availability-zone"
    values = ["us-east-1a", "us-east-1b", "us-east-1c"]
  }

  tags = {
    tier = "private"
  }
}

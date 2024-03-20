data "aws_ami" "this" {
  most_recent = true
  owners      = ["591542846629"] # account id for Amazon

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

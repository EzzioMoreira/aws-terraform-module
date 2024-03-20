resource "aws_launch_template" "this" {
  name                                 = "${local.cluster_name}-template-ecs-ec2"
  description                          = "Launch template for ECS EC2 instances to ${local.cluster_name}"
  key_name                             = "platform-infraestructure"
  vpc_security_group_ids               = aws_security_group.this[*].id
  image_id                             = data.aws_ami.this.id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = "t2.micro"
  ebs_optimized                        = false

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size           = 10
      volume_type           = "gp3"
      delete_on_termination = true
    }
  }

  cpu_options {
    core_count       = 4
    threads_per_core = 2
  }

  credit_specification {
    cpu_credits = "standard"
  }

  iam_instance_profile {
    name = "ecsInstanceRole-${local.cluster_name}"
  }

  instance_market_options {
    market_type = "spot"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = false
  }

  placement {
    availability_zone = "us-est-1a"
  }

  tag_specifications {
    resource_type = "instance"

    tags = local.tags
  }
}

resource "aws_launch_template" "this" {
  name                                 = "${local.cluster_name}-template-ecs-ec2"
  description                          = "Launch template for ECS EC2 instances to ${local.cluster_name}"
  key_name                             = "platform-infraestructure"
  image_id                             = data.aws_ami.this.id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = local.environment[terraform.workspace].autoscaling.instance_type
  ebs_optimized                        = false

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size           = 10
      volume_type           = "gp3"
      delete_on_termination = true
    }
  }

  credit_specification {
    cpu_credits = "standard"
  }

  iam_instance_profile {
    name = "ecs-node-profile-${local.cluster_name}"
  }

  instance_market_options {
    market_type = local.environment[terraform.workspace].autoscaling.instance_market
  }

  tag_specifications {
    resource_type = "instance"

    tags = local.tags
  }
}

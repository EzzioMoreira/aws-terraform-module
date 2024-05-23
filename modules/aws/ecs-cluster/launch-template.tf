data "template_file" "userdata" {
  template = <<-EOF
    #!/bin/bash
    echo ECS_CLUSTER=ecs-cluster-${var.cluster_name} >> /etc/ecs/ecs.config
    echo ECS_ENABLE_CONTAINER_METADATA=true >> /etc/ecs/ecs.config
  EOF
}

resource "aws_launch_template" "this" {
  name                                 = "template-ecs-ec2-${var.cluster_name}"
  description                          = "Launch template for ECS EC2 instances to cluster ${var.cluster_name}"
  key_name                             = "platform-infraestructure"
  image_id                             = data.aws_ami.this.id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = var.instance_type
  ebs_optimized                        = false
  user_data                            = base64encode(data.template_file.userdata.rendered)

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
    name = aws_iam_instance_profile.this.name
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.this.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = var.tags
  }
}
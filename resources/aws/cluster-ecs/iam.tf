data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "this" {
  name               = "ecs-node-role-${local.cluster_name}"
  assume_role_policy = data.aws_iam_policy_document.this.json
  tags               = local.tags
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "this" {
  name = "ecs-node-profile-${local.cluster_name}"
  path = "/ecs/instance/"
  role = aws_iam_role.this.name
  tags = local.tags
}

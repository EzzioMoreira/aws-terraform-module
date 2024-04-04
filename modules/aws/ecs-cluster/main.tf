resource "aws_ecs_cluster" "this" {
  name = "ecs-cluster-${var.cluster_name}"

  tags = var.tags
}

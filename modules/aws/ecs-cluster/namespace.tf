resource "aws_service_discovery_http_namespace" "this" {
  name        = "ecs-cluster-${var.cluster_name}"
  description = "Namespace for ECS Cluster ecs-cluster-${var.cluster_name}"

  tags = var.tags
}

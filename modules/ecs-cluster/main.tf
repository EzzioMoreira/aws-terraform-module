resource "aws_ecs_cluster" "this" {
  name = "ecs-cluster-${var.cluster_name}"
  service_connect_defaults {
    namespace = aws_service_discovery_http_namespace.this.arn
  }

  tags = var.tags
}

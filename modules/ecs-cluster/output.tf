output "ecs_cluster" {
  value = {
    cluster_name     = aws_ecs_cluster.this.name
    min_size         = var.min_size
    max_size         = var.max_size
    desired_capacity = var.desired_size
    vpc_id           = var.vpc_id
    namespace_arn    = aws_service_discovery_http_namespace.this.arn
    tags             = var.tags
  }
  description = "value of the ecs cluster"
}

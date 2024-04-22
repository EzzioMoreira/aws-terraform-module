output "ecs_cluster" {
  value = {
    cluster_name     = aws_ecs_cluster.this.name
    min_size         = var.min_size
    max_size         = var.max_size
    desired_capacity = var.desired_size
    tags             = var.tags
  }
  description = "value of the ecs cluster"
}

output "autoscaling_name" {
  value = aws_autoscaling_group.this.name
}

output "vpc_id" {
  value = var.vpc_id
  description = "value of the vpc id"
}

output "namespace_arn" {
  value = aws_service_discovery_http_namespace.this.arn
  description = "value of the namespace arn"
}

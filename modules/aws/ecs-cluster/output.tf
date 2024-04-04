output "ecs_cluster" {
  value = {
    cluster_name     = aws_ecs_cluster.this.name
    min_size         = var.min_size
    max_size         = var.max_size
    desired_capacity = var.desired_size
    tags             = var.tags
  }
}

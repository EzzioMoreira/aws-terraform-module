output "cluster_o11y" {
  value       = module.ecs_cluster
  description = "value of the ecs cluster"
}

output "loadbalance" {
  value       = module.loadbalance
  description = "value of the loadbalance"
}

output "name" {
  value       = module.ecs_cluster_development
  description = "exibe todos atributos do cluster"
}

output "loadbalance" {
  value       = module.loadbalance
  description = "exibe todos atributos do loadbalance"
}

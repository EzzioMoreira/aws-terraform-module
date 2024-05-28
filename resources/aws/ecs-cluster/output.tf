output "name" {
  value       = module.ecs_cluster
  description = "exibe todos atributos do cluster"
}

output "loadbalance" {
  value       = module.loadbalance
  description = "exibe todos atributos do loadbalance"
}

output "security_group" {
  value       = aws_security_group.this.id
  description = "exibe atributos do security group"
}

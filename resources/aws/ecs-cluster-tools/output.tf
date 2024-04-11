output "cluster_tools" {
  value = module.ecs_cluster
}

output "security_group_tools" {
  value = aws_security_group.this.id
}

output "load_balance_arn" {
  value = module.loadbalance.lb_arn
}

output "load_balance_dns" {
  value = module.loadbalance.lb_dns_name
}

output "load_balance_zone_id" {
  value = module.loadbalance.load_balance_zone_id
}

output "target_group_arn_http" {
  value = aws_lb_target_group.http.arn
}

output "target_group_arn_https" {
  value = aws_lb_target_group.https.arn
}

output "listener_arns" {
  value = module.loadbalance.listener_arns
}

output "cluster_o11y" {
  value = {
    cluster_name  = module.ecs_cluster.ecs_cluster.cluster_name
    security_group_ids = [aws_security_group.this.id]
    load_balance_arn = module.loadbalance.lb_arn
    load_balance_dns = module.loadbalance.lb_dns_name
    load_balance_zone_id = module.loadbalance.load_balance_zone_id
  }
  description = "values of the cluster o11y"
}

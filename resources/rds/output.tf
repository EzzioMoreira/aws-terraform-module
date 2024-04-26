output "rds_grafana" {
  value = module.db_grafana
  sensitive = true
  description = "value of the RDS instance for Grafana"
}
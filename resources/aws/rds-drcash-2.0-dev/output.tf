output "rds_hostname" {
  value       = module.database-rds-rapadura2.rds_hostname
  description = "value of rds_hostname"
}

output "secret_version_arn" {
  value       = module.database-rds-rapadura2.secret_version_arn
  description = "value of db_username"
  sensitive   = false
}

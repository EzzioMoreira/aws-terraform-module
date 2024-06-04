output "rds_hostname" {
  value       = module.database-rds-drcash2.rds_hostname
  description = "value of rds_hostname"
}

output "secret_version_arn" {
  value       = module.database-rds-drcash2.secret_version_arn
  description = "value of db_username"
  sensitive   = false
}

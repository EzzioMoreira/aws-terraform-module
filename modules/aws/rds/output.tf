output "rds_hostname" {
  value       = aws_db_instance.this.address
  description = "Hostname da instância RDS"
}

output "secret_version_arn" {
  value = {
    for key, _ in local.parameters : key => aws_secretsmanager_secret_version.this[key].arn
  }
  description = "value of the secret version ARN"
  sensitive   = false
}


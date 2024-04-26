output "rds_hostname" {
  value       = aws_db_instance.this.address
  description = "Hostname da instância RDS"
}

output "ssm_rds" {
  value       = aws_secretsmanager_secret.this
  sensitive   = true
  description = "values of the secrets stored in AWS Secrets Manager"
}

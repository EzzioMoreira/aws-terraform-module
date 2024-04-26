locals {
  parameters = {
    db_endpoint = {
      description = "database endpoint"
      value       = aws_db_instance.this.address
    }
    db_passwd = {
      description = "database password"
      value       = aws_db_instance.this.password
    }
    db_name = {
      description = "database name"
      value       = aws_db_instance.this.db_name
    }
    db_user = {
      description = "database user"
      value       = aws_db_instance.this.username
    }
  }
}

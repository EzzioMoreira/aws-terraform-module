locals {
  parameters = {
    db_passwd = {
      description = "database password"
      value       = aws_db_instance.this.password
    }
    db_user = {
      description = "database user"
      value       = aws_db_instance.this.username
    }
  }
}

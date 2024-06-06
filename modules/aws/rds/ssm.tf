resource "aws_secretsmanager_secret" "this" {
  for_each = local.parameters

  name        = "${terraform.workspace}/${var.rds_name}_${each.key}"
  description = "DB ${var.rds_name} secret for ${each.key}"

  tags = var.tags

  depends_on = [aws_db_instance.this]
}

resource "aws_secretsmanager_secret_version" "this" {
  for_each = local.parameters

  secret_id     = aws_secretsmanager_secret.this[each.key].id
  secret_string = each.value.value

  lifecycle {
    ignore_changes = [secret_string]
  }
}

resource "random_password" "this" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

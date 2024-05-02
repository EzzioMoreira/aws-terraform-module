resource "aws_db_subnet_group" "this" {
  name       = "${var.db_name}-subnet-group"
  subnet_ids = data.aws_subnets.private.ids

  tags = var.tags
}

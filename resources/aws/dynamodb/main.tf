resource "aws_dynamodb_table" "terraform-lock" {
  name           = "terraform_state_lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = local.tags
}

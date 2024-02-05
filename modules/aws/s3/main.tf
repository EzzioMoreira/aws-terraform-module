resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = var.tags
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = var.acl
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = var.public_access
  block_public_policy     = var.public_access
  ignore_public_acls      = var.public_access
  restrict_public_buckets = var.public_access
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id
  versioning_configuration {
    status = var.versioning
  }
}

resource "aws_s3_bucket_metric" "this" {
  bucket = aws_s3_bucket.this.id
  name   = "EntireBucket"
}

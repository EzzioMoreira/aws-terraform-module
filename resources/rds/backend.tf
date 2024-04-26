terraform {
  backend "s3" {
    bucket = "ezzio-moreira-tfstate"
    key    = "aws/rds-o11y/terraform.tfstate"
    region = "us-east-1"
  }
}

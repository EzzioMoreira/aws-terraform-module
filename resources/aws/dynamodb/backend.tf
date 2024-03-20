terraform {
  backend "s3" {
    bucket = "drcash-terraform-tfstate"
    key    = "aws/dynamodb/aws/terraform.tfstate"
    region = "us-east-1"
  }
}

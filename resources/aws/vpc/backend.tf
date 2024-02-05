terraform {
  backend "s3" {
    bucket = "drcash-terraform-tfstate"
    key    = "aws/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

terraform {
  backend "s3" {
    bucket = "rapadura-terraform-tfstate"
    key    = "aws/vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

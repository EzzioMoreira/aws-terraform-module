terraform {
  backend "s3" {
    bucket         = "rapadura-terraform-tfstate"
    key            = "aws/rapadura2/rds-dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state_lock"
  }
}

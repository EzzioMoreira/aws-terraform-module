terraform {
  backend "s3" {
    bucket         = "drcash-terraform-tfstate"
    key            = "aws/drcash2/rest-api-gateway/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state_lock"
  }
}

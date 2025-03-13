terraform {
  backend "s3" {
    bucket         = "rapadura-terraform-tfstate"
    key            = "github/repos/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state_lock"
  }
}

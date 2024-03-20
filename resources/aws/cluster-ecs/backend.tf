terraform {
  backend "s3" {
    bucket         = "drcash-terraform-tfstate"
    key            = "grafana/integration/aws/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state_lock"
  }
}

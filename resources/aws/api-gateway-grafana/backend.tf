terraform {
  backend "s3" {
    bucket         = "drcash-terraform-tfstate"
    key            = "aws/api-gateway/grafana-web/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state_lock"
  }
}

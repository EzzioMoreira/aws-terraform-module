terraform {
  backend "s3" {
    bucket         = "rapadura-terraform-tfstate"
    key            = "aws/ecs-cluster-tools/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform_state_lock"
  }
}

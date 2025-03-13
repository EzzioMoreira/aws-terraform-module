terraform {
  backend "s3" {
    bucket = "rapadura-terraform-tfstate"
    key    = "grafana/integration/aws/terraform.tfstate"
    region = "us-east-1"
  }
}

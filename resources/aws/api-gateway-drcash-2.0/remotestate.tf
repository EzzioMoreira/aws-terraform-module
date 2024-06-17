data "terraform_remote_state" "ecs_cluster_dev" {
  backend   = "s3"
  workspace = "development"
  config = {
    bucket = "drcash-terraform-tfstate"
    key    = "aws/ecs-cluster/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "ecs_cluster_prd" {
  backend   = "s3"
  workspace = "production"
  config = {
    bucket = "drcash-terraform-tfstate"
    key    = "aws/drcash2/rds-dev/terraform.tfstate"
    region = "us-east-1"
  }
}

data "terraform_remote_state" "rds-dev" {
  backend   = "s3"
  workspace = "development"
  config = {
    bucket = "drcash-terraform-tfstate"
    key    = "aws/drcash2/rds-dev/terraform.tfstate"
    region = "us-east-1"
  }
}

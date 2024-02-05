module "vpc" {
  source = "../../../modules/aws/vpc"

  vpc_cidr = local.environment[terraform.workspace].vpc_cidr

  tags = local.tags

}
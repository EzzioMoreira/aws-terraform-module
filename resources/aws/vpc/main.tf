module "vpc" {
  source   = "../../../modules/aws/vpc"
  vpc_cidr = local.environment[terraform.workspace].vpc_cidr
  vpc_id   = module.vpc.vpc_id

  subnet_cidr = local.environment[terraform.workspace].subnets

  availability_zones = local.environment[terraform.workspace].availability_zones


  tags = local.tags
}

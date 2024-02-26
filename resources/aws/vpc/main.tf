module "vpc" {
  source = "../../../modules/aws/vpc"
  vpc_cidr = local.environment[terraform.workspace].vpc_cidr
  vpc_id = module.vpc.vpc_id

  subnet_cidr = for idx, subnet in local.environment[terraform.workspace].subnets : idx => subnet.cidr

  availability_zones = local.environment[terraform.workspace].availability_zones


  tags = local.tags
}

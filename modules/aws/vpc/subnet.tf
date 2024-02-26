resource "aws_subnet" "this" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet_cidr
  availability_zone = var.availability_zone
  private_dns_hostname_type_on_launch = "ip-name"
  map_public_ip_on_launch = var.public_ip

  tags = var.tags
}

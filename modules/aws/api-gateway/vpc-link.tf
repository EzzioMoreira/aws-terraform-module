# VPC Link (Private API)
resource "aws_apigatewayv2_vpc_link" "this" {
  for_each = var.vpc_links

  name               = each.key
  security_group_ids = each.value["security_group_ids"]
  subnet_ids         = each.value["subnet_ids"]

  tags = merge(var.tags, var.vpc_link_tags, try(each.value.tags, {}))
}

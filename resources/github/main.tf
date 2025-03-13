module "rapadura_github" {
  source = "../../modules/github"

  for_each = { for key, value in local.repository_github : key => value }

  repository_name = each.value.name
  description     = each.value.description
}

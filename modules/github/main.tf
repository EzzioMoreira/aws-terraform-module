resource "github_repository" "this" {
  name        = var.repository_name
  description = var.description
  auto_init   = var.auto_init

  visibility             = var.visibility
  allow_squash_merge     = var.allow_squash_merge
  delete_branch_on_merge = var.delete_branch_on_merge
}

resource "github_branch" "development" {
  count      = var.branch_name != null ? 1 : 0
  repository = github_repository.this.name
  branch     = var.branch_name
}

resource "github_branch_default" "main" {
  repository = github_repository.this.name
  branch     = "main"
}

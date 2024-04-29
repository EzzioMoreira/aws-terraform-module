resource "github_branch_protection_v3" "this" {
  repository                      = github_repository.this.name
  branch                          = "main"
  require_conversation_resolution = true

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 2
  }
}

resource "github_repository_dependabot_security_updates" "this" {
  repository = github_repository.this.id
  enabled    = true
}

locals {
  default_branch      = "master"
  enable_restrictions = var.additional_master_push_users != ""
}

resource "github_repository" "main" {
  name        = var.repo_name
  description = var.description

  homepage_url = var.homepage_url
  private      = var.private
  archived     = var.archived
  topics       = var.topics

  has_issues    = var.private ? false : true
  has_downloads = true
  has_projects  = false
  has_wiki      = false
}

resource "github_branch_protection" "main" {
  repository = github_repository.main.name
  branch     = local.default_branch

  enforce_admins = false

  required_status_checks {
    strict = var.status_checks_strict
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = false
    dismissal_teams                 = []
    dismissal_users                 = []
    require_code_owner_reviews      = false
    required_approving_review_count = 1
  }

  lifecycle {
    ignore_changes = [
      required_status_checks.0.contexts
    ]
  }

  dynamic "restrictions" {
    for_each = local.enable_bucket_logging ? [1] : []
    content {
      users = var.additional_master_push_users
    }
  }

  depends_on = [github_repository.main]
}


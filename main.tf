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

  is_template = var.is_template

  default_branch         = var.default_branch_name
  delete_branch_on_merge = var.delete_branch_on_merge

  dynamic "template" {
    for_each = var.template != null ? [var.template] : []
    content {
      owner      = template.value.owner
      repository = template.value.repository
    }
  }
}

resource "github_branch_protection" "main" {
  repository = github_repository.main.name
  branch     = var.default_branch_name

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
    for_each = var.additional_master_push_users
    content {
      users = [restrictions.value]
    }
  }

  depends_on = [github_repository.main]
}


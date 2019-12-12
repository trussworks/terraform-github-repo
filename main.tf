locals {
  default_branch = "master"
}

resource "github_repository" "main" {
  name        = var.repo_name
  description = var.description

  homepage_url = var.homepage_url
  private      = var.private
  topics       = var.topics

  has_issues    = var.private ? false : true
  has_downloads = true
  has_projects  = false
  has_wiki      = false
}

resource "github_branch_protection" "main" {
  repository = github_repository.main.name
  branch     = local.default_branch

  required_status_checks {
    strict = var.strict_status_checks
  }

  lifecycle {
    ignore_changes = [
      required_status_checks.0.contexts
    ]
  }
}


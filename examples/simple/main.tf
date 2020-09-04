module "test_github_repo" {
  source = "../../"

  repo_name   = "${var.test_name}-test"
  description = "an empty repo to test some terraform against"
  private     = false
}

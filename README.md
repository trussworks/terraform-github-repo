Set up a github repository with standard config.

Limited options are provided as this module is for configuring a repository using opinionated settings. If more control is needed, use the [terraform github_repository](https://www.terraform.io/docs/providers/github/r/repository.html) directly.

## Usage

```hcl
module "github_terraform_aws_ecs_service" {
  source       = "trussworks/repo/github"

  repo_name    = "terraform-aws-ecs-service"
  description  = "Creates an ECS Service."
  homepage_url = "https://registry.terraform.io/modules/trussworks/ecs-service/aws"

  topics = [
    "terraform",
    "terraform-modules",
    "aws-ecs",
    "ecs",
    "ecs-service",
  ]

  private             = false
  status_check_strict = true
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| description | A description of the repository | string | n/a | yes |
| homepage\_url | URL of a page describing the project | string | `""` | no |
| private | Set to true to create a private repository. Repositories are created as private by default | bool | `"true"` | no |
| repo\_name | The name of the repository | string | n/a | yes |
| status\_check\_strict | Require branches to be up to date before merging | bool | `"true"` | no |
| topics | The list of topics for the repository | list(string) | `[]` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Developer Setup

Install dependencies (macOS)

```shell
brew install pre-commit go terraform terraform-docs
pre-commit install --install-hooks
```

### Accessing the GitHub API

Set `GITHUB_TOKEN` environment variable. See the [terraform github provider token docs](https://www.terraform.io/docs/providers/github/index.html#token). You will need to [create a github personal access token](https://github.com/settings/tokens/new) with "Full control of private repositories" access scope.

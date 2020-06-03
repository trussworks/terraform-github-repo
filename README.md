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
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| github | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_master\_push\_users | The list of Github usernames allowed to push to the protected master branch | `list(string)` | `[]` | no |
| archived | Specifies if the repository should be archived | `bool` | `false` | no |
| delete\_branch\_on\_merge | Delete branches upon merge | `bool` | `true` | no |
| description | A description of the repository | `string` | n/a | yes |
| homepage\_url | URL of a page describing the project | `string` | `""` | no |
| private | Set to true to create a private repository. Repositories are created as private by default | `bool` | `true` | no |
| repo\_name | The name of the repository | `string` | n/a | yes |
| status\_checks\_strict | Require branches to be up to date before merging | `bool` | `true` | no |
| topics | The list of topics for the repository | `list(string)` | `[]` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Note on auto-init

We tried using the auto-init variable on the repo resource from the [GitHub Terraform Provider](https://www.terraform.io/docs/providers/github/index.html) and found that it is

1. Not a fun workflow
1. Still has outstanding issues/bugs related to it

The behavior around what happens when you update or continually run Terraform with a resource with `auto-init = true` so we're not willing to deal with that.

## Developer Setup

Install dependencies (macOS)

```shell
brew install pre-commit go terraform terraform-docs
pre-commit install --install-hooks
```

### Accessing the GitHub API

Set `GITHUB_TOKEN` environment variable. See the [terraform github provider token docs](https://www.terraform.io/docs/providers/github/index.html#token). You will need to [create a github personal access token](https://github.com/settings/tokens/new) with "Full control of private repositories" access scope.

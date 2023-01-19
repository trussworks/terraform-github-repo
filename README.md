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

  private              = false
  status_checks_strict = true
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 4.10.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | >= 4.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_branch.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch) | resource |
| [github_branch_default.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_default) | resource |
| [github_branch_protection.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection) | resource |
| [github_repository.main](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_push_users"></a> [additional\_push\_users](#input\_additional\_push\_users) | The list of Github usernames allowed to push to the protected main branch | `list(string)` | `[]` | no |
| <a name="input_archived"></a> [archived](#input\_archived) | Specifies if the repository should be archived | `bool` | `false` | no |
| <a name="input_default_branch_name"></a> [default\_branch\_name](#input\_default\_branch\_name) | The default branch for the repo. Branch protection settings will be applied to the branch with this name. Currently defaults to `main`. | `string` | `"main"` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | Delete branches upon merge | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | A description of the repository | `string` | n/a | yes |
| <a name="input_has_discussions"></a> [has\_discussions](#input\_has\_discussions) | Set to true to enable GitHub Discussions on the repository. | `bool` | `false` | no |
| <a name="input_has_issues"></a> [has\_issues](#input\_has\_issues) | Set to false to disable the GitHub Issues features on the repository. | `bool` | `true` | no |
| <a name="input_has_projects"></a> [has\_projects](#input\_has\_projects) | Set to true to enable the GitHub Projects features on the repository. | `bool` | `false` | no |
| <a name="input_has_wiki"></a> [has\_wiki](#input\_has\_wiki) | Set to true to enable the GitHub Wiki features on the repository. | `bool` | `false` | no |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | URL of a page describing the project | `string` | `""` | no |
| <a name="input_is_template"></a> [is\_template](#input\_is\_template) | Tell GitHub that this is a template repository | `bool` | `false` | no |
| <a name="input_private"></a> [private](#input\_private) | Set to true to create a private repository. Repositories are created as private by default | `bool` | `true` | no |
| <a name="input_repo_name"></a> [repo\_name](#input\_repo\_name) | The name of the repository | `string` | n/a | yes |
| <a name="input_status_checks_strict"></a> [status\_checks\_strict](#input\_status\_checks\_strict) | Require branches to be up to date before merging | `bool` | `true` | no |
| <a name="input_template"></a> [template](#input\_template) | Template to use for creating the repo | <pre>object({<br>    owner      = string<br>    repository = string<br>  })</pre> | `null` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | The list of topics for the repository | `list(string)` | `[]` | no |

## Outputs

No outputs.
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

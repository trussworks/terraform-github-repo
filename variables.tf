variable "description" {
  description = "A description of the repository"
  type        = string
}

variable "homepage_url" {
  description = "URL of a page describing the project"
  default     = ""
  type        = string
}

variable "private" {
  description = "Set to true to create a private repository. Repositories are created as private by default"
  default     = true
  type        = bool
}

variable "archived" {
  description = "Specifies if the repository should be archived"
  default     = false
  type        = bool
}

variable "repo_name" {
  description = "The name of the repository"
  type        = string
}

variable "status_checks_strict" {
  description = "Require branches to be up to date before merging"
  default     = true
  type        = bool
}

variable "topics" {
  description = "The list of topics for the repository"
  default     = []
  type        = list(string)
}

variable "additional_master_push_users" {
  description = "The list of Github usernames allowed to push to the protected master branch"
  default     = []
  type        = list(string)
}

variable "delete_branch_on_merge" {
  description = "Delete branches upon merge"
  default     = true
  type        = bool
}

variable "template" {
  description = "Optional template to use for creating the repo"
  default     = null
  type = object({
    owner      = string
    repository = string
  })
}

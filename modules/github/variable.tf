variable "repository_name" {
  description = "The name of the repository"
  type        = string
}

variable "description" {
  description = "The description of the repository"
  type        = string
}

variable "visibility" {
  description = "The visibility of the repository"
  type        = string
  default     = "internal"
}

variable "allow_squash_merge" {
  description = "Whether or not to allow squash merging"
  type        = bool
  default     = true
}

variable "delete_branch_on_merge" {
  description = "Whether or not to delete the branch on merge"
  type        = bool
  default     = true
}

variable "auto_init" {
  description = "Whether or not to auto initialize the repository"
  type        = bool
  default     = true
}

variable "branch_name" {
  description = "The name of the branch"
  type        = string
  default     = null
}

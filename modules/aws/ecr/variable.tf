variable "name" {
  description = "The name of the repository"
  type        = string
}

variable "image_tag_mutability" {
  description = "The tag mutability setting for the repository"
  type        = string
  default     = "IMMUTABLE"
}

variable "repository_encryption_type" {
  description = "The encryption type to use for the repository"
  type        = string
  default     = "AES256"
}

variable "repository_kms_key" {
  description = "The ARN of the KMS key to use when encrypting the repository"
  type        = string
  default     = null
}

variable "repository_force_delete" {
  description = "If the repository should be deleted even if it contains images"
  type        = bool
  default     = true
}

variable "repository_image_scan_on_push" {
  description = "If the repository should have image scanning on push"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
}

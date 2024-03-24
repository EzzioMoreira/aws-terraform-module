variable "bucket_name" {
  type        = string
  description = "Nome do bucket S3"
}

variable "tags" {
  type        = map(string)
  description = "description"
}

variable "acl" {
  type        = string
  description = "ACL aplicada ao bucket"
  default     = "private"
  validation {
    condition     = contains(["private", "public-read", "public-read-write", "aws-exec-read", "authenticated-read", "log-delivery-write"], var.acl)
    error_message = "ACL inválida, valores permitidos: private, public-read, public-read-write, aws-exec-read, authenticated-read, log-delivery-write."
  }
}

variable "public_access" {
  type        = bool
  description = "Configurações de acesso público"
  default     = true
}

variable "versioning" {
  type        = string
  description = "Ativa/desativa o versionamento do bucket"
  default     = "Disabled"
}

variable "force_destroy" {
  type        = bool
  default     = true
  description = "Exclui o bucket mesmo que ele não esteja vazio"
}

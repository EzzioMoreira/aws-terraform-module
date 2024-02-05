variable bucket_name {
  type        = string
  description = "Nome do bucket S3"
}

variable region {
  type        = string
  default     = "us-east-1"
  description = "Região AWS"
}

variable tags {
  type        = map(string)
  default     = {
    name      = "${var.bucket_name}"
    env       = ""
  }
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
  validation {
    condition     = contains(["true", "false"], var.public_access)
    error_message = "Valores permitidos: true, false."
  }
}

variable "versioning" {
  type = string
  description = "Ativa/desativa o versionamento do bucket"
  default = "Disabled"
  validation {
    condition = contains(["Enabled", "Disabled"], var.versioning)
    error_message = "Valores permitidos: Enabled, Disabled."
  }
}

variable force_destroy {
  type        = bool
  default     = true
  description = "Exclui o bucket mesmo que ele não esteja vazio"
  validation {
    condition     = contains(["true", "false"], var.force_destroy)
    error_message = "Valores permitidos: true, false."
  }
}

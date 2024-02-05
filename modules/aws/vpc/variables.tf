variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Região AWS"
}

variable "tags" {
  type = object({
    name          = string
    env           = string
    service       = string
    team          = string
    project       = string
    repository    = string
    documentation = string
    created       = string
  })
  description = "Tags para recursos"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR da VPC"
}

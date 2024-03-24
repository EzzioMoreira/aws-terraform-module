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

variable "vpc_id" {
  type        = string
  description = "ID da VPC"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR das subnets"
}

variable "availability_zones" {
  type        = string
  description = "Zonas de disponibilidade para subnet"
}

variable "public_ip" {
  type        = bool
  default     = "false"
  description = "Habilitar IP público"
}

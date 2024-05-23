variable "name" {
  description = "value of the load balancer name"
  type        = string
}

variable "type" {
  description = "value of the load balancer type"
  type        = string
  default     = "application"
  validation {
    condition     = var.type == "application" || var.type == "network"
    error_message = "Load balancer type must be either 'application' or 'network'"
  }
}

variable "internal" {
  description = "value of the load balancer internal or external flag"
  type        = bool
  default     = true
  validation {
    condition     = var.internal == true || var.internal == false
    error_message = "Internal flag must be either 'true' or 'false'"
  }
}

variable "security_group_ids" {
  description = "value of the security group ids associated with the load balancer"
  type        = list(string)
}

variable "subnet_ids" {
  description = "value of the subnet ids associated with the load balancer"
  type        = list(string)

  validation {
    condition     = length(var.subnet_ids) >= 2
    error_message = "Must provide at least two subnets"
  }

  validation {
    condition     = alltrue([for id in var.subnet_ids : id != ""])
    error_message = "Subnet ID must not be empty"
  }
}

variable "tags" {
  description = "value of the tags to apply to the load balancer"
  type        = map(string)
}

variable "cluster_name" {
  type        = string
  description = "value of the ECS cluster name"
}

variable "tags" {
  type        = map(string)
  description = "value of the tags to apply to the ECS cluster"
}

variable "min_size" {
  type        = number
  description = "value of the minimum size of the ECS cluster"
}

variable "max_size" {
  type        = number
  description = "value of the maximum size of the ECS cluster"
}

variable "desired_size" {
  type        = number
  description = "value of the desired capacity of the ECS cluster"
}

variable "instance_type" {
  type        = string
  description = "value of the instance type of the ECS cluster"
}

variable "instance_market" {
  type        = string
  default     = null
  description = "value of the instance market of the ECS cluster"
}

variable "vpc_id" {
  type        = string
  description = "value of the VPC ID of the ECS cluster"
}

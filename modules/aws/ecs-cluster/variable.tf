variable "cluster_name" {
  type        = string
  description = "value of the ECS cluster name"
}

variable "tags" {
  type = map(string)
  default = {
    "env"              = ""
    "service"          = ""
    "team"             = ""
    "repository"       = ""
    "documentation"    = ""
    "created"          = ""
    "AmazonECSManaged" = "true"
  }
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
  default = "vpc-0fdcf082b368d1f78"
}

variable "subnet_ids" {
  type        = list(string)
  description = "value of the subnet IDs of the ECS cluster"
  default = ["subnet-006bc41eeaeef42b1", "subnet-0e250f6caeebdf88b", "subnet-039de1a90eaf9955a"] 
}

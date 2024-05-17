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
  default     = "t3.medium"
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
  default     = "vpc-0fdcf082b368d1f78"
}

variable "subnet_ids" {
  type        = list(string)
  description = "value of the subnet IDs of the ECS cluster"
  default     = ["subnet-006bc41eeaeef42b1", "subnet-0e250f6caeebdf88b", "subnet-039de1a90eaf9955a"]
}

variable "autoscaling_instace_type" {
  type = list(object({
    instance_type     = string
    weighted_capacity = number
  }))
  description = "value of the instance type of the ECS cluster"
}

variable "up_cpu_scaling_policy" {
  type = object({
    scaling_adjustment = number
    cooldown           = number
    cpu_target_value   = number
  })
  default = {
    scaling_adjustment = 1
    cooldown           = 300
    cpu_target_value   = 80.0
  }
  description = "value of the up cpu scaling policy of the ECS cluster"
}

variable "down_cpu_scaling_policy" {
  type = object({
    scaling_adjustment = number
    cooldown           = number
    cpu_target_value   = number
  })
  default = {
    scaling_adjustment = -1
    cooldown           = 300
    cpu_target_value   = 40.0
  }
  description = "value of the down cpu scaling policy of the ECS cluster"
}

variable "on_demand_percentage_above_base_capacity" {
  type        = number
  default     = 100
  description = "value of the on demand percentage above base capacity of the ECS cluster"
}

variable "spot_allocation_strategy" {
  type        = string
  default     = "lowest-price"
  description = "value of the spot allocation strategy of the ECS cluster"
}

variable "spot_instance_pools" {
  type        = number
  default     = 2
  description = "value of the spot instance pools of the ECS cluster"
}

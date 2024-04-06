variable "name" {
  description = "value for name"
  type        = string
}

variable "cluster_id" {
  description = "ID do cluster"
  type        = string
}

variable "desired_count" {
  description = "value for desired_count"
  type        = number
}

variable "subnets" {
  description = "value for subnets"
  type        = list(string)
}

variable "security_groups" {
  description = "value for security_groups"
  type        = list(string)
}

variable "assign_public_ip" {
  description = "value for assign_public_ip"
  type        = bool
  default     = false
}

variable "resources" {
  description = "values for resources in task_definition"
  type = object({
    cpu    = number
    memory = number
  })
}

variable "execution_role_arn" {
  description = "value for execution_role_arn"
  type        = string
  default     = ""
}

variable "load_balancer" {
  description = "values for load_balancer"
  type = object({
    target_group_arn = string
    container_name   = string
    container_port   = number
  })
  default = null
}

variable "container_definitions" {
  description = "values for container_definitions"
  type = map(
    object({
      name   = string
      image  = string
      cpu    = optional(string, "0.5") # 0.5 vCPU
      memory = optional(string, "512") # 512 MiB
      port_mappings = list(object({
        container_port = optional(number, 80)
        host_port      = optional(number, 80)
        protocol       = optional(string, "tcp")
      }))
      essential = optional(bool, true)
      environment_variables = optional(list(object({
        name  = string
        value = string
      })), [])

      secrets = optional(list(object({
        name      = string
        valueFrom = string
      })), [])

      health_check = object({
        command     = list(string)
        retries     = optional(number, 5)
        timeout     = optional(number, 10)
        interval    = optional(number, 5)
        startPeriod = optional(number, 30)
        }
      )
      expose = optional(bool, false)
    })
  )
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

variable "log_group" {
  description = "Time retention in dyas to log groups"
  default     = 7
  validation {
    condition     = var.log_group >= 0 && var.log_group <= 365
    error_message = "log_group must be between 0 and 365"
  }
}

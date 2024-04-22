variable "name" {
  description = "value for name"
  type        = string
}

variable "cluster_name" {
  description = "name of the cluster"
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
      name      = string
      image     = string
      cpu       = optional(number, 256) # 0.5 vCPU
      memory    = optional(number, 512) # 512 MiB
      essential = optional(bool, true)
      expose    = optional(bool, false)
      port_mappings = optional(list(object({
        name          = string
        containerPort = number
        hostPort      = number
        protocol      = string
        appProtocol   = string
      })), [])

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
    })
  )
}

variable "volume" {
  description = "Volume configuration for the task"
  type = object({
    name           = string
    file_system_id = string
    root_directory = optional(string, "/")
  })
  default = null
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

variable "log_retention" {
  description = "Time retention in dyas to log groups"
  default     = 7
  validation {
    condition     = var.log_retention >= 0 && var.log_retention <= 365
    error_message = "log_retention must be between 0 and 365"
  }
}

variable "service_connect_configuration" {
  description = "The ECS Service Connect configuration for this service to discover and connect to services, and be discovered by, and connected from, other services within a namespace"
  type        = any
  default     = {}
}


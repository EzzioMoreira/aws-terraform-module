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
  type = list(object({
    target_group_arn = string
    container_name   = string
    container_port   = number
  }))
  default = []
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
      user      = optional(string, null)
      command   = optional(list(string), null)

      port_mappings = optional(list(object({
        name          = string
        containerPort = number
        hostPort      = optional(number, null)
        protocol      = string
        appProtocol   = string
      })), [])

      mountPoints = optional(list(object({
        sourceVolume  = optional(string)
        containerPath = optional(string)
        readOnly      = optional(bool, false)
      })), [])

      environment_variables = optional(list(object({
        name  = string
        value = string
      })), [])

      secrets = optional(list(object({
        name      = string
        valueFrom = string
      })), [])

      logConfiguration = optional(object({
        logDriver = string
        options   = optional(map(string))
      }))

      firelensConfiguration = optional(object({
        type    = optional(string)
        options = optional(map(string))
      }))

      health_check = optional(object({
        command     = optional(list(string))
        retries     = optional(number, 5)
        timeout     = optional(number, 10)
        interval    = optional(number, 5)
        startPeriod = optional(number, 30)
        }
      ))
    })
  )
}

variable "volume" {
  description = "Volume configuration for the task"
  type = list(object({
    name      = string
    host_path = string
  }))
  default = []
}

variable "create_autoscaling" {
  description = "value for create_autoscaling"
  type        = bool
  default     = false
}

variable "privileged" {
  description = "value for privileged"
  type        = bool
  default     = false
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

variable "scheduling_strategy" {
  description = "The scheduling strategy to use for the service"
  type        = string
  default     = "REPLICA"
  validation {
    condition     = var.scheduling_strategy == "REPLICA" || var.scheduling_strategy == "DAEMON"
    error_message = "scheduling_strategy must be either REPLICA or DAEMON"
  }
}

variable "network_mode" {
  description = "The network mode to use for the task"
  type        = string
  default     = "bridge"
  validation {
    condition     = var.network_mode == "awsvpc" || var.network_mode == "bridge" || var.network_mode == "host" || var.network_mode == "none"
    error_message = "network_mode must be either awsvpc, bridge, host, or none"
  }
}

variable "task_role_arn" {
  description = "The ARN of IAM role that allows your Amazon ECS container task to make calls to other AWS services"
  type        = string
  default     = null
}

variable "autoscaling_app" {
  description = "The autoscaling configuration for the service"
  type = object({
    min_capacity = number
    max_capacity = number
    target       = number
  })
  default = {
    min_capacity = 1
    max_capacity = 2
    target       = 80
  }
}

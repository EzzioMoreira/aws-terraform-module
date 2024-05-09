variable "aws_region" {
  default     = "us-east-1"
  description = "Region of Amazon AWS"
}

variable "storage" {
  type        = number
  default     = 20
  description = "The allocated storage"
}

variable "storage_type" {
  type        = string
  default     = "gp3"
  description = "The type of the storage"
}

variable "engine" {
  type        = string
  default     = "postgres"
  description = "The database engine"
}

variable "engine_version" {
  default     = "16.1"
  type        = string
  description = "The engine version for database"
}

variable "multi_az" {
  type        = bool
  default     = false
  description = "Whether to create a Multi-AZ RDS instance"
}

variable "db_name" {
  default     = "postgres"
  type        = string
  description = "The name of the database"
}

variable "rds_name" {
  default     = "drcash-db"
  type        = string
  description = "The name of the RDS instance"
}

variable "backup_retention" {
  type        = number
  default     = 7
  description = "The backup retention period"
}

variable "instance_type" {
  default     = "db.t3.micro"
  type        = string
  description = "The RDS instance class"
}

variable "db_username" {
  default     = "drcash"
  type        = string
  description = "Username of the database"
}

variable "port" {
  default     = "5432"
  type        = number
  description = "The database port"
}

variable "parameter_group_name" {
  default     = "default.postgres16"
  type        = string
  description = "Name of the DB parameter group to associate"
}

variable "snapshot" {
  default     = "true"
  type        = string
  description = "Whether to create a final snapshot"
}

variable "tags" {
  type        = map(string)
  description = "value of the tags to apply to the ECS cluster"
}

variable "vpc_id" {
  type        = string
  default     = "vpc-0fdcf082b368d1f78"
  description = "value of the VPC ID"
}

variable "publicly_accessible_rds" {
  type        = bool
  default     = false
  description = "Whether the RDS instance is publicly accessible"
}

variable "ingress_security_group_rules" {
  type = list(object({
    from_port                = number
    to_port                  = number
    protocol                 = string
    description              = string
  }))
  description = "List of ingress security group rules"
}

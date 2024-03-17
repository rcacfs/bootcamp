// Elastic Load Balancer
variable "alb_name" {
  default = "bootcamp-prod"
}

// database 
variable "allow_major_version_upgrade" {
  default = true
}

variable "engine_name" {
  description = "database name"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "database version"
  default     = "14.7"
  type        = string
}


variable "name" {
  description = "Database Instance Identifier"
  type        = string
  default     = "bootcamp-database"
}

variable "port" {
  description = "database port"
  type        = number
  default     = 5432
}

variable "username" {
  description = "master username"
  default     = "root"
  type        = string
}


variable "database_name" {
  description = "database name"
  default     = "bootcamp-database"
  type        = string
}

variable "password" {
  default = "password"
}

variable "allocated_storage" {
  description = "db instance disk space"
  type        = number
  default     = 50
}

variable "instance_class" {
  description = "database instance class"
  type        = string
  default     = "db.t4g.small"
}

variable "storage_encrypted" {
  description = "encryption"
  type        = bool
  default     = true
}

variable "max_allocated_storage" {
  type    = number
  default = 100
}

variable "license_model" {
  description = "DB instance license"
  type        = string
  default     = null
}

variable "storage_type" {
  description = "storage type"
  default     = "gp3"
}

variable "apply_immediately" {
  default = "true"
}

variable "deletion_protection" {
  default = false
}

variable "publicly_accessible" {
  default = false
}

variable "db_cluster_db_instance_parameter_group_name" {
  default = "bootcamp-pg"
}


variable "environment" {
  type = string
  default = "dev"
}

variable "aws_region" {
  type = string
  default = "us-east-2"
}

variable "cluster_identifier" {
  type        = string
  description = "Identifier for the db cluster"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones."
}

variable "database_name" {
  type        = string
  description = "Database name."
}

variable "backup_retention_period" {
  type        = number
  default     = 5
  description = "Backup retention period."
}

variable "preferred_backup_window" {
  type        = string
  description = "Preferred backup window."
  default     = "07:00-09:00"
}

variable "num_instances" {
  type        = number
  description = "Preferred number of db instances."
}

variable "deletion_protection" {
  type        = bool
  default     = true
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true."
}

variable "final_snapshot_enabled" {
  type        = bool
  default     = true
  description = "If a final snapshot will be taken upon deletion of the db. snapshot Identifier is available as an output."
}

variable "port" {
  type        = number
  default     = 5432
  description = "The port on which the DB accepts connections."
}

variable "db_engine" {
  type        = string
  description = "DB engine."
  default     = "aurora-postgresql"
}

variable "db_engine_version" {
  type        = string
  description = "DB engine version."
  default     = "11.6"
}

variable "publicly_accessible" {
  type        = bool
  description = "whether db is accessable via the internet"
  default     = false
}

variable "instance_class" {
  type = string
  description = "RDS instance class."
}

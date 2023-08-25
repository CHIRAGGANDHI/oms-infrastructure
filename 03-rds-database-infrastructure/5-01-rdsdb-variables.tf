# Terraform AWS RDS Database Variables
# Place holder file for AWS RDS Database

# DB engine
variable "db_rds_engine" {
  description = "AWS RDS Database Engine"
  type        = string
  default     = "aurora-postgresql"
}

variable "db_rds_engine_mode" {
  description = "AWS RDS Database Engine Mode"
  type        = string
  default     = "provisioned"
}

# DB engine version
variable "db_rds_engine_version" {
  description = "AWS RDS Database Engine Version"
  type        = string
  default     = "15.3"
}

variable "db_rds_auto_scaling_enabled" {
  type    = bool
  default = false
}

variable "db_rds_auto_scaling_config" {
  type = map(number)
  default = {
    "min_capacity" = 2
    "max_capacity" = 5
  }
}

variable "db_rds_logtypes" {
  type    = list(string)
  default = ["postgresql", "upgrade"]
}

variable "db_rds_storage_encrypted" {
  type = bool
}

variable "db_rds_monitoring_interval" {
  type = number
}

variable "db_rds_performance_insights_enabled" {
  type = bool
}

variable "db_rds_publicly_accessible" {
  type = bool
}

variable "db_rds_backup_retention_period" {
  type = number
}

variable "db_rds_deletion_protection" {
  type = bool
}
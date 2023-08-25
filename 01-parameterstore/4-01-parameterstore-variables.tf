# DB Username - Enable Sensitive flag
variable "db_rds_username" {
  description = "AWS RDS Database Administrator Username"
  type        = string
}

# DB Password - Enable Sensitive flag
variable "db_rds_password" {
  description = "AWS RDS Database Administrator Password"
  type        = string
  sensitive   = true
}

variable "mq_broker_admin_username" {
  description = "MQ Admin Broker UserName"
  type        = string
}

variable "mq_broker_admin_password" {
  description = "MQ Admin Broker Password"
  type        = string
  sensitive   = true
}

variable "global_access_key" 
{
  type        =  string
}  
variable "global_secret_key" 
{
  type        = string
}  

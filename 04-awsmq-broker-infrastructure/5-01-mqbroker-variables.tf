variable "mq_broker_deployment_mode" {
  description = "AWS MQ Broker deployment mode"
  type        = string
  default     = "SINGLE_INSTANCE"
}

variable "mq_broker_host_instance_type" {
  description = "AWS MQ Broker instance type"
  type        = string
  default     = "mq.t3.micro"
}

variable "mq_broker_engine_version" {
  description = "AWS MQ Broker engine version"
  type        = string
  default     = "3.11.16"
}

variable "mq_broker_publicly_accessible" {
  description = "AWS MQ Broker can be accessed directly, outside of a VPC"
  type        = bool
  default     = false
}



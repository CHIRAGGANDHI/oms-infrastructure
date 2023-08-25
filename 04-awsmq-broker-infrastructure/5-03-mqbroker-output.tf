output "mq_broker_arn" {
  description = "AmazonMQ broker ARN"
  value       = module.mq_broker.broker_arn
}

output "mq_broker_id" {
  description = "AmazonMQ broker ID"
  value = module.mq_broker.broker_id
}

output "mq_broker_primary_amqp_ssl_endpoint" {
  value = module.mq_broker.primary_amqp_ssl_endpoint
}

output "mq_broker_primary_console_url" {
  description = "AmazonMQ active web console URL"
  value = module.mq_broker.primary_console_url
}

output "mq_broker_primary_ssl_endpoint" {
  description = "AmazonMQ primary SSL endpoint"
  value       = module.mq_broker.primary_ssl_endpoint
}



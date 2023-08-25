resource "aws_ssm_parameter" "mqbroker_webconsole_endpoint" {
  name  = "${local.mqbrokerprefix}/webconsole-endpoint"
  type  = "String"
  value = module.mq_broker.primary_console_url
  description = "MQ Broker Web Console"

  tags = local.common_tags
}

resource "aws_ssm_parameter" "mqbroker_endpoint" {
  name  = "${local.mqbrokerprefix}/endpoint"
  type  = "String"
  value = module.mq_broker.primary_ssl_endpoint
  description = "MQ Broker Endpoint"

  tags = local.common_tags
}
# Get value from parameter store
data "aws_ssm_parameter" "mq_broker_admin_username" {
  name = "${local.mqbrokerprefix}/adminusername"
}

data "aws_ssm_parameter" "mq_broker_admin_password" {
  name = "${local.mqbrokerprefix}/adminpassword"
}
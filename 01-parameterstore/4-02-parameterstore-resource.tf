resource "aws_ssm_parameter" "dbname" {
  name  = "${local.dbparameterprefix}/dbname"
  type  = "String"
  value = local.db_rds_dbname
  description = "Client Database Name"

  tags = local.common_tags
}

resource "aws_ssm_parameter" "dbuser" {
  name  = "${local.dbparameterprefix}/user"
  type  = "String"
  value = var.db_rds_username
  description = "Client Database User"

  tags = local.common_tags
}

resource "aws_ssm_parameter" "dbpassword" {
  name  = "${local.dbparameterprefix}/password"
  type  = "SecureString"
  value = var.db_rds_password
  description = "Client Database Password"

  tags = local.common_tags
}

resource "aws_ssm_parameter" "mqbrokeradminusername" {
  name  = "${local.mqbrokerprefix}/adminusername"
  type  = "String"
  value = var.mq_broker_admin_username
  description = "MQ Broker Admin Username"

  tags = local.common_tags
}

resource "aws_ssm_parameter" "mqbrokeradminpassword" {
  name  = "${local.mqbrokerprefix}/adminpassword"
  type  = "SecureString"
  value = var.mq_broker_admin_password
  description = "MQ Broker Admin Password"

  tags = local.common_tags
}
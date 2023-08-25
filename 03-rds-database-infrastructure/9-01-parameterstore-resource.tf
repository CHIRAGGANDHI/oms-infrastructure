resource "aws_ssm_parameter" "rds_proxy_host_endpoint" {
  depends_on = [ module.rds_aurora_postgresql_v2 ]
  name  = "${local.dbparameterprefix}/host"
  type  = "String"
  value = module.aurora_postgresql_rds_proxy.proxy_endpoint
  description = "Client Database Host Name"

  tags = local.common_tags
}
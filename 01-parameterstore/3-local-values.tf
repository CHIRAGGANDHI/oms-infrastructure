locals {
  owners = var.business_divsion
  space = var.space
  environment = var.environment  

  name = "${local.owners}-${local.space}-${local.environment}"
  db_rds_dbname = "${local.space}${local.environment}"

  parameterstoreprefix = "/${local.owners}/${local.space}/${local.environment}"
  dbparameterprefix = "${local.parameterstoreprefix}/aws-db-pgsql/dbConnectionString"
  mqbrokerprefix = "${local.parameterstoreprefix}/aws-mq-broker"

  common_tags = {
    owners = local.owners
    space = local.space
    environment = local.environment    
  }
}
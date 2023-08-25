locals {
  owners = var.business_divsion
  space = var.space
  environment = var.environment  

  name = "${local.owners}-${local.space}-${local.environment}"
  
  parameterstoreprefix = "/${local.owners}/${local.space}/${local.environment}"
  dbparameterprefix = "${local.parameterstoreprefix}/aws-db-pgsql/dbConnectionString"

  common_tags = {
    owners = local.owners
    space = local.space
    environment = local.environment    
  }
}
locals {
  owners = var.business_divsion
  space = var.space
  environment = var.environment  

  name = "${local.owners}-${local.space}-${local.environment}"

  parameterstoreprefix = "/${local.owners}/${local.space}/${local.environment}"
  mqbrokerprefix = "${local.parameterstoreprefix}/aws-mq-broker"

  common_tags = {
    owners = local.owners
    space = local.space
    environment = local.environment    
  }
}
module "rds_aurora_postgresql_v2" {
  source = "terraform-aws-modules/rds-aurora/aws"
  version = "8.3.1"

  name = "${local.name}-postgresqlv2-cluster"

  engine            = var.db_rds_engine
  engine_mode       = var.db_rds_engine_mode
  engine_version    = var.db_rds_engine_version

  instance_class = "db.serverless"
  instances = {
    one = {}
    two = {}
    three = {}
  }
  serverlessv2_scaling_configuration = {
    min_capacity = var.db_rds_auto_scaling_config.min_capacity
    max_capacity = var.db_rds_auto_scaling_config.max_capacity
  }
  autoscaling_enabled      = var.db_rds_auto_scaling_enabled
  
  vpc_id = data.terraform_remote_state.vpc-infrastructure.outputs.vpc_id
  db_subnet_group_name = data.terraform_remote_state.vpc-infrastructure.outputs.database_subnet_group_name
  #vpc_security_group_ids = [data.terraform_remote_state.vpc-infrastructure.outputs.security_group_id]
  security_group_rules = {
    vpc_ingress = {
      cidr_blocks = [data.terraform_remote_state.vpc-infrastructure.outputs.vpc_cidr_block] #data.terraform_remote_state.vpc-infrastructure.outputs.public_subnets_cidr_blocks
    }
  }

  storage_encrypted                  = var.db_rds_storage_encrypted
  apply_immediately                  = true
  monitoring_interval                = var.db_rds_monitoring_interval
  performance_insights_enabled       = var.db_rds_performance_insights_enabled
  publicly_accessible                = var.db_rds_publicly_accessible
  enabled_cloudwatch_logs_exports    = var.db_rds_logtypes
  backup_retention_period            = var.db_rds_backup_retention_period

  database_name                      = data.aws_ssm_parameter.db_rds_initial_databasename.value
  deletion_protection                = var.db_rds_deletion_protection
  master_username                    = data.aws_ssm_parameter.db_rds_user.value
  master_password                    = data.aws_ssm_parameter.db_rds_password.value
  manage_master_user_password        = false
  skip_final_snapshot                = true
  final_snapshot_identifier          = null  

  tags = local.common_tags
}
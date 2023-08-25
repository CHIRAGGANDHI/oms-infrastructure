module "aurora_postgresql_rds_proxy" {
  source  = "terraform-aws-modules/rds-proxy/aws"
  version = "3.0.0"

  name = "${local.name}-postgresql-rds-proxy"

  engine_family = "POSTGRESQL"
  target_db_cluster     = true
  db_cluster_identifier = module.rds_aurora_postgresql_v2.cluster_id

  idle_client_timeout = 5400 //seconds
  max_connections_percent = 100

  iam_role_name = "${local.name}-rds-proxy-role"
  auth = {
      "superuser" = {
        description        = "Aurora PostgreSQL superuser password"
        secret_arn         = aws_secretsmanager_secret.rds_secretsmanager_credential.id
      }
    }

  vpc_subnet_ids = [
    data.terraform_remote_state.vpc-infrastructure.outputs.private_subnets[0], 
    data.terraform_remote_state.vpc-infrastructure.outputs.private_subnets[1]
  ]
  vpc_security_group_ids = [data.terraform_remote_state.vpc-infrastructure.outputs.rds_sg_group_id]

  tags = local.common_tags
}
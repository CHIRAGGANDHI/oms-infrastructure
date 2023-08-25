# Creating a AWS Secret for API Service User 
resource "aws_secretsmanager_secret" "rds_secretsmanager_credential" {
  name        = "${local.name}-rds-postgres-secret"
  description = "Aurora Postgres Credential"
  recovery_window_in_days = 0
  tags = local.common_tags
}

resource "aws_secretsmanager_secret_version" "rds_secretsmanager_credential" {
  secret_id     = aws_secretsmanager_secret.rds_secretsmanager_credential.id
  secret_string = <<EOF
  {
    "username": "${data.aws_ssm_parameter.db_rds_user.value}",
    "password": "${data.aws_ssm_parameter.db_rds_password.value}",
    "engine": "postgres",
    "port": ${module.rds_aurora_postgresql_v2.cluster_port},
    "dbClusterIdentifier": "${module.rds_aurora_postgresql_v2.cluster_id}"
  }
  EOF
}
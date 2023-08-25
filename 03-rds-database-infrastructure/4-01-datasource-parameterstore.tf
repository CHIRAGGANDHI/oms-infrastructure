# Get value from parameter store
data "aws_ssm_parameter" "db_rds_initial_databasename" {
  name = "${local.dbparameterprefix}/dbname"
}

data "aws_ssm_parameter" "db_rds_user" {
  name = "${local.dbparameterprefix}/user"
}

data "aws_ssm_parameter" "db_rds_password" {
  name = "${local.dbparameterprefix}/password"
}
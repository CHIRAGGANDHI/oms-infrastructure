output "rds_secretmanager_id" {
  value     = aws_secretsmanager_secret.rds_secretsmanager_credential.id
}
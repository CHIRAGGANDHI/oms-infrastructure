output "db_rds_cluster_arn" {
  description = "Amazon Resource Name (ARN) of cluster"
  value       = try(module.rds_aurora_postgresql_v2.cluster_arn, null)
}

output "db_rds_databaseName" {
  value = module.rds_aurora_postgresql_v2.cluster_database_name
  sensitive = true
}

output "db_rds_cluster_reader_endpoint" {
  value = module.rds_aurora_postgresql_v2.cluster_reader_endpoint
}

output "db_rds_cluster_write_endpoint" {
  value = module.rds_aurora_postgresql_v2.cluster_endpoint
}

output "db_rds_security_group_id" {
  description = "The security group ID of the cluster"
  value       = module.rds_aurora_postgresql_v2.security_group_id
}

output "db_rds_host_name" {
  description = "Database Host"
  value       = module.rds_aurora_postgresql_v2.cluster_id
}

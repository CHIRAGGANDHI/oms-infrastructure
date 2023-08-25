module "mq_broker" {
    source = "cloudposse/mq-broker/aws"
    version = "3.1.0"

    engine_type                   = "RabbitMQ"
    deployment_mode               = var.mq_broker_deployment_mode
    name                          = "${local.name}-mq-broker"
    host_instance_type            = var.mq_broker_host_instance_type

    mq_application_user = [data.aws_ssm_parameter.mq_broker_admin_username.value]
    mq_application_password = [data.aws_ssm_parameter.mq_broker_admin_password.value]

    mq_admin_user = [data.aws_ssm_parameter.mq_broker_admin_username.value]
    mq_admin_password = [data.aws_ssm_parameter.mq_broker_admin_password.value]

    ssm_parameter_name_format = "%s/%s"
    ssm_path = local.mqbrokerprefix
    mq_admin_user_ssm_parameter_name = "adminusername"
    mq_admin_password_ssm_parameter_name = "adminpassword"
    mq_application_user_ssm_parameter_name = "applicationusername"
    mq_application_password_ssm_parameter_name = "applicationpassword"    

    engine_version                  = var.mq_broker_engine_version

    publicly_accessible             = var.mq_broker_publicly_accessible

    create_security_group           = false
    
    vpc_id                          = data.terraform_remote_state.vpc-infrastructure.outputs.vpc_id
    subnet_ids                      = [data.terraform_remote_state.vpc-infrastructure.outputs.private_subnets[2]]
    associated_security_group_ids   = [data.terraform_remote_state.vpc-infrastructure.outputs.mqbroker_sg_group_id]

    apply_immediately               = true
    auto_minor_version_upgrade      = true     
    general_log_enabled             = true
    audit_log_enabled               = false
    encryption_enabled              = true
    use_aws_owned_key               = true   

    tags = local.common_tags 
  }
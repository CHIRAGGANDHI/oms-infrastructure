# AWS EC2 Security Group Terraform Module
# Security Group for Private EC2 Instances

module "mqbroker_sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "5.1.0"

    name = "${local.name}-mqbroker-sg"
    description = "Access to AWS MQ Broker for entire VPC CIDR Block"
    vpc_id = module.vpc.vpc_id

    #Ingress Rules
    ingress_rules = [ "activemq-5671-tcp", "https-443-tcp"]
    ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

    #Egress Rules
    egress_rules = ["all-all"]
    
    tags = local.common_tags
}
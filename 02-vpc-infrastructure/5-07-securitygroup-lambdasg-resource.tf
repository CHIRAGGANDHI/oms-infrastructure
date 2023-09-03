# AWS EC2 Security Group Terraform Module
# Security Group for Private EC2 Instances

module "lambda_sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "5.1.0"

    name = "${local.name}-lambda-sg"
    description = "Lambda Security Group"

    vpc_id = module.vpc.vpc_id    

    #Egress Rules
    egress_rules = ["all-all"]
    
    tags = local.common_tags
}
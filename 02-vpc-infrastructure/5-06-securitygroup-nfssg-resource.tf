# AWS EC2 Security Group Terraform Module
# Security Group for Private EC2 Instances

module "nfs_sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "5.1.0"

    name = "${local.name}-nfs-sg"
    description = "Access to EFS for entire VPC CIDR Block"
    vpc_id = module.vpc.vpc_id

    #Ingress Rules
    ingress_rules = [ "nfs-tcp"]
    ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

    #Egress Rules
    egress_rules = ["all-all"]
    
    tags = local.common_tags
}
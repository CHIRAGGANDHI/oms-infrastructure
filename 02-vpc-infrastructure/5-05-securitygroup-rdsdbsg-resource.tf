# AWS EC2 Security Group Terraform Module
# Security Group for Private EC2 Instances

module "rdsdb_sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "5.1.0"

    name = "${local.name}-rdsdb-sg"
    description = "Access to PostgreSQL DB for entire VPC CIDR Block"
    vpc_id = module.vpc.vpc_id

    #Ingress Rules
    ingress_with_cidr_blocks = [ 
        {
            from_port = 5432
            to_port = 5432
            protocol = "tcp"
            description = "PostgreSQL DB access from within VPC"
            cidr_blocks = module.vpc.vpc_cidr_block
        } 
    ]

    #Egress Rules
    egress_rules = ["all-all"]
    
    tags = local.common_tags
}
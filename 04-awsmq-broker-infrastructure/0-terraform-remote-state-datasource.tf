data "terraform_remote_state" "vpc-infrastructure" {
    backend = "s3"
    config = {
      bucket = "oms-deployment-state"
      key = "theoldmonks/dev/vpc/terraform.tfstate"
      region = "ap-south-1"
    }
}
##-----------------------------------------------------------------------------
# Providers
provider "aws" {
  alias  = "example"
  region = "us-east-1"
}

##-----------------------------------------------------------------------------
# Module: VPC
module "vpc" {
  source    = "../"
  providers = { aws.this = aws.example }
  
  details = {
    scope               = "Infrastructure"
    purpose             = "VPC Production"
    environment         = "prd"
    additional_tags = {
      "Project"         = "Project Name"
      "ProjectID"       = "123456789"
      "Contact"         = "David Singer - david.singer@example.com"
    }
  }
  
  vpc_name                            = "Production"

  network_availability_zones          = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
  network_ip_network                  = "172.24.0.0"
  network_ip_netmask                  = "19"
  network_acl_ingress_use_default_all = true
  network_acl_egress_use_default_all  = true
  
  enable_igw_on_restricted_subnets    = false
}

##-----------------------------------------------------------------------------
# Outputs
output "vpc" {
  description = "VPC"
  value = module.vpc.metadata
}

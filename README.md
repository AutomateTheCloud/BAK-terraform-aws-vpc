# VPC - AWS Terraform Module
Terraform module to create an AWS VPC

## What's Included?
- [VPC](#vpc)

***

## Usage
```hcl
module "vpc" {
  source    = "../"
  providers = { aws.this = aws }

  details = {
    scope               = "Infrastructure"
    purpose             = "Terraform Backend"
    environment         = "prd"
    additional_tags = {
      "Project"         = "Project Name"
      "ProjectID"       = "123456789"
      "Contact"         = "David Singer - david.singer@example.com"
    }
  }

  vpc_name                            = "Production"

  s3_bucket_logs_id                   = "logs-default-primary-123456789012"

  network_availability_zones          = [ "us-east-1a", "us-east-1b", "us-east-1c" ]
  network_ip_network                  = "172.24.0.0"
  network_ip_netmask                  = "19"
  network_acl_ingress_use_default_all = true
  network_acl_egress_use_default_all  = true
}
```

***

## Inputs
| Name | Description | Type | Default |
|------|-------------|:----:|:-------:|
| `enable_igw_on_restricted_subnets` | Enable IGW routing on Restricted Subnets | `bool` | `false` |
| `network_availability_zones` | (Required) Network Availability Zones (3 zones required) | `list` | `[]` |
| `network_acl_egress_use_default_all` | Network ACL Egress: Use Default All | `bool` | `true` |
| `network_acl_ingress_use_default_all` | Network ACL Ingress: Use Default All | `bool` | `true` |
| `network_ip_netmask` | (Required) Network IP netmask | `number` | `16` |
| `network_ip_network` | (Required) Network IP network CIDR | `string` | `172.16.0.0` |
| `s3_bucket_logs_id` | (Required) S3 Bucket - Logs: ID | `string` | |
| `vpc_name` | (Required) VPC Name | `string` | |

## Inputs (Details)
| Name | Description | Type | Default |
|------|-------------|:----:|:-------:|
| `details.scope` | (Required) Scope Name - What does this object belong to? (Organization Name, Project, etc) | `string` | |
| `details.scope_abbr` | (Optional) Scope [Abbreviation](#Abbreviations) Override | `string` | |
| `details.purpose` | (Required) Purpose Name - What is the purpose or function of this object, or what does this object server? | `string` | |
| `details.purpose_abbr` | (Optional) Purpose [Abbreviation](#Abbreviations) Override | `string` | |
| `details.environment` | (Required) Environment Name | `string` | |
| `details.environment_abbr` | (Optional) Environment [Abbreviation](#Abbreviations) Override | `string` | |
| `details.additional_tags` | (Optional) [Additional Tags](#Additional-Tags) for resources | `map` | `[]` |

***

## Outputs
All outputs from this module are mapped to a single output named `metadata` to make it easier to capture all of the relevant metadata that would be useful when referenced by other stacks (requires only a single output reference in your code, instead of dozens!)

| Name | Description |
|:-----|:------------|
| `details.scope.name` | Scope name |
| `details.scope.abbr` | Scope abbreviation |
| `details.scope.machine` | Scope machine-friendly abbreviation |
| `details.purpose.name` | Purpose name |
| `details.purpose.abbr` | Purpose abbreviation |
| `details.purpose.machine` | Purpose machine-friendly abbreviation |
| `details.environment.name` | Environment name |
| `details.environment.abbr` | Environment abbreviation |
| `details.environment.machine` | Environment machine-friendly abbreviation |
| `details.tags` | Map of tags applied to all resources |
| `aws.account.id` | AWS Account ID |
| `aws.region.name` | AWS Region name, example: `us-east-1` |
| `aws.region.abbr` | AWS Region four letter abbreviation, example: `use1` |
| `aws.region.description` | AWS Region description, example: `US East (N. Virginia)` |
| `db_subnet_group.private.id` | DB Subnet Group (private): ID |
| `db_subnet_group.restricted.id` | DB Subnet Group (restricted): ID |
| `db_subnet_group.public.id` | DB Subnet Group (public): ID |
| `elasticache_subnet_group.private.id` | Elasticache Subnet Group (private): ID |
| `elasticache_subnet_group.restricted.id` | Elasticache Subnet Group (restricted): ID |
| `elasticache_subnet_group.public.id` | Elasticache Subnet Group (public): ID |
| `internet_gateway.id` | Internet Gateway ID |
| `kms.data.key_id` | KMS Key - Data: Key ID |
| `kms.data.key_arn` | KMS Key - Data: ARN |
| `kms.data.alias_name` | KMS Key - Data: Alias Name |
| `kms.data.alias_arn` | KMS Key - Data: Key Alias ARN |
| `network_acl.private.id` | Network ACL (private): ID |
| `network_acl.restricted.id` | Network ACL (restricted): ID |
| `network_acl.public.id` | Network ACL (public): ID |
| `route_table.private.1.id` | Route Table (private) - AZ 1: ID |
| `route_table.private.2.id` | Route Table (private) - AZ 2: ID |
| `route_table.private.3.id` | Route Table (private) - AZ 3: ID |
| `route_table.restricted.1.id` | Route Table (restricted) - AZ 1: ID |
| `route_table.restricted.2.id` | Route Table (restricted) - AZ 2: ID |
| `route_table.restricted.3.id` | Route Table (restricted) - AZ 3: ID |
| `route_table.public.1.id` | Route Table (public) - AZ 1: ID |
| `route_table.public.2.id` | Route Table (public) - AZ 2: ID |
| `route_table.public.3.id` | Route Table (public) - AZ 3: ID |
| `s3_bucket.logs.id` | S3 Bucket - Logs: ID |
| `subnet.private.1.id` | Subnet (private) - AZ 1: ID |
| `subnet.private.1.arn` | Subnet (private) - AZ 1: ARN |
| `subnet.private.1.availability_zone` | Subnet (private) - AZ 1: Availability Zone |
| `subnet.private.1.cidr_block` | Subnet (private) - AZ 1: CIDR Block |
| `subnet.private.2.id` | Subnet (private) - AZ 2: ID |
| `subnet.private.2.arn` | Subnet (private) - AZ 2: ARN |
| `subnet.private.2.availability_zone` | Subnet (private) - AZ 2: Availability Zone |
| `subnet.private.2.cidr_block` | Subnet (private) - AZ 2: CIDR Block |
| `subnet.private.3.id` | Subnet (private) - AZ 3: ID |
| `subnet.private.3.arn` | Subnet (private) - AZ 3: ARN |
| `subnet.private.3.availability_zone` | Subnet (private) - AZ 3: Availability Zone |
| `subnet.private.3.cidr_block` | Subnet (private) - AZ 3: CIDR Block |
| `subnet.restricted.1.id` | Subnet (restricted) - AZ 1: ID |
| `subnet.restricted.1.arn` | Subnet (restricted) - AZ 1: ARN |
| `subnet.restricted.1.availability_zone` | Subnet (restricted) - AZ 1: Availability Zone |
| `subnet.restricted.1.cidr_block` | Subnet (restricted) - AZ 1: CIDR Block |
| `subnet.restricted.2.id` | Subnet (restricted) - AZ 2: ID |
| `subnet.restricted.2.arn` | Subnet (restricted) - AZ 2: ARN |
| `subnet.restricted.2.availability_zone` | Subnet (restricted) - AZ 2: Availability Zone |
| `subnet.restricted.2.cidr_block` | Subnet (restricted) - AZ 2: CIDR Block |
| `subnet.restricted.3.id` | Subnet (restricted) - AZ 3: ID |
| `subnet.restricted.3.arn` | Subnet (restricted) - AZ 3: ARN |
| `subnet.restricted.3.availability_zone` | Subnet (restricted) - AZ 3: Availability Zone |
| `subnet.restricted.3.cidr_block` | Subnet (restricted) - AZ 3: CIDR Block |
| `subnet.public.1.id` | Subnet (public) - AZ 1: ID |
| `subnet.public.1.arn` | Subnet (public) - AZ 1: ARN |
| `subnet.public.1.availability_zone` | Subnet (public) - AZ 1: Availability Zone |
| `subnet.public.1.cidr_block` | Subnet (public) - AZ 1: CIDR Block |
| `subnet.public.2.id` | Subnet (public) - AZ 2: ID |
| `subnet.public.2.arn` | Subnet (public) - AZ 2: ARN |
| `subnet.public.2.availability_zone` | Subnet (public) - AZ 2: Availability Zone |
| `subnet.public.2.cidr_block` | Subnet (public) - AZ 2: CIDR Block |
| `subnet.public.3.id` | Subnet (public) - AZ 3: ID |
| `subnet.public.3.arn` | Subnet (public) - AZ 3: ARN |
| `subnet.public.3.availability_zone` | Subnet (public) - AZ 3: Availability Zone |
| `subnet.public.3.cidr_block` | Subnet (public) - AZ 3: CIDR Block |
| `vpc.id` | VPC: ID |
| `vpc.arn` | VPC: ARN |
| `vpc.cidr_block` | VPC: CIDR Block |
| `vpc.owner_id` | VPC: Owner ID |
| `vpc.name` | VPC: Name |
| `vpc.abbr` | VPC: Abbreviation |
| `vpc.machine` | VPC: Machine-friendly abbreviation |
| `vpc_endpoint.dynamodb.id` | VPC Endpoint - DynamoDB: ID |
| `vpc_endpoint.s3.id` | VPC Endpoint - S3: ID |

```hcl
metadata = {
  "aws" = {
    "account" = {
      "id" = "123456789012"
    }
    "region" = {
      "abbr" = "use1"
      "description" = "US East (N. Virginia)"
      "name" = "us-east-1"
    }
  }
  "db_subnet_group" = {
    "private" = {
      "id" = "production-db-private-use1"
    }
    "public" = {
      "id" = "production-db-public-use1"
    }
    "restricted" = {
      "id" = "production-db-restricted-use1"
    }
  }
  "details" = {
    "environment" = {
      "abbr" = "prd"
      "machine" = "prd"
      "name" = "prd"
    }
    "purpose" = {
      "abbr" = "terraform_backend"
      "machine" = "terraformbackend"
      "name" = "Terraform Backend"
    }
    "scope" = {
      "abbr" = "infrastructure"
      "machine" = "infrastructure"
      "name" = "Infrastructure"
    }
    "tags" = {
      "Contact" = "David Singer - david.singer@example.com"
      "Environment" = "prd"
      "Project" = "Project Name"
      "ProjectID" = "123456789"
      "Purpose" = "Terraform Backend"
      "Scope" = "Infrastructure"
    }
  }
  "elasticache_subnet_group" = {
    "private" = {
      "id" = "production-elasticache-private-use1"
    }
    "public" = {
      "id" = "production-elasticache-public-use1"
    }
    "restricted" = {
      "id" = "production-elasticache-restricted-use1"
    }
  }
  "internet_gateway" = {
    "id" = "igw-0aa760136d7c70858"
  }
  "kms" = {
    "data" = {
      "alias_arn" = "arn:aws:kms:us-east-1:123456789012:alias/data-production"
      "alias_name" = "alias/data-production"
      "key_arn" = "arn:aws:kms:us-east-1:123456789012:key/f511a6b4-85f3-4d49-b639-7af20b0c471f"
      "key_id" = "f511a6b4-85f3-4d49-b639-7af20b0c471f"
    }
  }
  "network_acl" = {
    "private" = {
      "id" = "acl-0fde4d6b1fdc2c661"
    }
    "public" = {
      "id" = "acl-0ce458154eb81706b"
    }
    "restricted" = {
      "id" = "acl-043db5075ad57467f"
    }
  }
  "route_table" = {
    "private" = {
      "id" = "rtb-025b4239dcebd0404"
    }
    "public" = {
      "id" = "rtb-0020c2845727b0e93"
    }
    "restricted" = {
      "id" = "rtb-030dd42f8e4809e29"
    }
  }
  "s3_bucket" = {
    "logs" = {
      "id" = "logs-default-primary-123456789012"
    }
  }
  "subnet" = {
    "private" = {
      "1" = {
        "arn" = "arn:aws:ec2:us-east-1:123456789012:subnet/subnet-06efa8815da20ccfd"
        "availability_zone" = "us-east-1a"
        "cidr_block" = "172.24.0.0/22"
        "id" = "subnet-06efa8815da20ccfd"
      }
      "2" = {
        "arn" = "arn:aws:ec2:us-east-1:123456789012:subnet/subnet-0ff7e1b7230344c13"
        "availability_zone" = "us-east-1b"
        "cidr_block" = "172.24.4.0/22"
        "id" = "subnet-0ff7e1b7230344c13"
      }
      "3" = {
        "arn" = "arn:aws:ec2:us-east-1:123456789012:subnet/subnet-0d30f0c9e04922d7b"
        "availability_zone" = "us-east-1c"
        "cidr_block" = "172.24.8.0/22"
        "id" = "subnet-0d30f0c9e04922d7b"
      }
    }
    "public" = {
      "1" = {
        "arn" = "arn:aws:ec2:us-east-1:123456789012:subnet/subnet-08ca380f3c15ad800"
        "availability_zone" = "us-east-1a"
        "cidr_block" = "172.24.24.0/23"
        "id" = "subnet-08ca380f3c15ad800"
      }
      "2" = {
        "arn" = "arn:aws:ec2:us-east-1:123456789012:subnet/subnet-0b73f9089aeb6b234"
        "availability_zone" = "us-east-1b"
        "cidr_block" = "172.24.26.0/23"
        "id" = "subnet-0b73f9089aeb6b234"
      }
      "3" = {
        "arn" = "arn:aws:ec2:us-east-1:123456789012:subnet/subnet-0ce2d7c3da8db5bb9"
        "availability_zone" = "us-east-1c"
        "cidr_block" = "172.24.28.0/23"
        "id" = "subnet-0ce2d7c3da8db5bb9"
      }
    }
    "restricted" = {
      "1" = {
        "arn" = "arn:aws:ec2:us-east-1:123456789012:subnet/subnet-01ce9e2bbe6a7afa4"
        "availability_zone" = "us-east-1a"
        "cidr_block" = "172.24.12.0/22"
        "id" = "subnet-01ce9e2bbe6a7afa4"
      }
      "2" = {
        "arn" = "arn:aws:ec2:us-east-1:123456789012:subnet/subnet-08828606128b07534"
        "availability_zone" = "us-east-1b"
        "cidr_block" = "172.24.16.0/22"
        "id" = "subnet-08828606128b07534"
      }
      "3" = {
        "arn" = "arn:aws:ec2:us-east-1:123456789012:subnet/subnet-00bac1d04cb795fc3"
        "availability_zone" = "us-east-1c"
        "cidr_block" = "172.24.20.0/22"
        "id" = "subnet-00bac1d04cb795fc3"
      }
    }
  }
  "vpc" = {
    "abbr" = "production"
    "arn" = "arn:aws:ec2:us-east-1:123456789012:vpc/vpc-045939cc01e0214a2"
    "cidr_block" = "172.24.0.0/19"
    "id" = "vpc-045939cc01e0214a2"
    "machine" = "production"
    "name" = "Production"
    "owner_id" = "123456789012"
  }
  "vpc_endpoint" = {
    "dynamodb" = {
      "id" = "vpce-0e9bd673392a7ef9f"
    }
    "s3" = {
      "id" = "vpce-09ebda408613e0db9"
    }
  }
}
```

***

## Notes

### Abbreviations
* When generating resource names, the module converts each identifier to a more 'machine-friendly' abbreviated format, removing all special characters, replacing spaces with underscores (_), and converting to lowercase. Example: 'Demo - Module' => 'demo_module'
* Not all resource names allow underscores. When those are encountered, the detail identifier will have the underscore removed (test_example => testexample) automatically. This machine-friendly abbreviation is referred to as 'machine' within the module.
* The abbreviations can be overridden by suppling the abbreviated names (ie: scope_abbr). This is useful when you have a long name and need the created resource names to be shorter. Some resources in AWS have shorter name constraints than others, or you may just prefer it shorter. NOTE: If specifying the Abbreviation, be sure to follow the convention of no spaces and no special characters (except for underscore), otherwise resoure creation may fail.

### Additional Tags
* You can specify additional tags for resources by adding to the `details.additional_tags` map.
```
additional_tags = {
  "Example"         = "Extra Tag"
  "Project"         = "Project Name"
  "CostCenter"      = "123456"
}
```

***

## Terraform Versions
Terraform 0.12 is supported.

## Provider Versions
| Name | Version |
|------|---------|
| aws | `~> 3.35` |
| null | `~> 2.1` |

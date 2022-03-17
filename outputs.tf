output "metadata" {
  description = "Metadata"
  value = {
    details = {
      scope = {
        name    = local.scope.name
        abbr    = local.scope.abbr
        machine = local.scope.machine
      }
      purpose = {
        name    = local.purpose.name
        abbr    = local.purpose.abbr
        machine = local.purpose.machine
      }
      environment = {
        name    = local.environment.name
        abbr    = local.environment.abbr
        machine = local.environment.machine
      }
      tags = local.tags
    }

    aws = {
      account = {
        id = local.aws.account.id
      }
      region = {
        name        = local.aws.region.name
        abbr        = local.aws.region.abbr
        description = local.aws.region.description
      }
    }

    db_subnet_group = {
      private = {
        id = aws_db_subnet_group.private.id
      }
      restricted = {
        id = aws_db_subnet_group.restricted.id
      }
      public = {
        id = aws_db_subnet_group.public.id
      }
    }

    elasticache_subnet_group = {
      private = {
        id = aws_elasticache_subnet_group.private.id
      }
      restricted = {
        id = aws_elasticache_subnet_group.restricted.id
      }
      public = {
        id = aws_elasticache_subnet_group.public.id
      }
    }

    internet_gateway = {
      id = aws_internet_gateway.this.id
    }

    kms = {
      data = {
        key_id     = aws_kms_key.this.key_id
        key_arn    = aws_kms_key.this.arn
        alias_name = aws_kms_alias.this.name
        alias_arn  = aws_kms_alias.this.arn
      }
    }

    network_acl = {
      private = {
        id = aws_network_acl.private.id
      }
      restricted = {
        id = aws_network_acl.restricted.id
      }
      public = {
        id = aws_network_acl.public.id
      }
    }

    route_table = {
      private = {
        ids = [
          aws_route_table.private-1.id,
          aws_route_table.private-2.id,
          aws_route_table.private-3.id
        ]
        1 = { id = aws_route_table.private-1.id }
        2 = { id = aws_route_table.private-2.id }
        3 = { id = aws_route_table.private-3.id }
      }
      restricted = {
        ids = [
          aws_route_table.restricted-1.id,
          aws_route_table.restricted-2.id,
          aws_route_table.restricted-3.id
        ]
        1 = { id = aws_route_table.restricted-1.id }
        2 = { id = aws_route_table.restricted-2.id }
        3 = { id = aws_route_table.restricted-3.id }
      }
      public = {
        ids = [
          aws_route_table.public-1.id,
          aws_route_table.public-2.id,
          aws_route_table.public-3.id
        ]
        1 = { id = aws_route_table.public-1.id }
        2 = { id = aws_route_table.public-2.id }
        3 = { id = aws_route_table.public-3.id }
      }
    }

    subnet = {
      private = {
        ids = [
          aws_subnet.private-1.id,
          aws_subnet.private-2.id,
          aws_subnet.private-3.id
        ]
        1 = {
          id                = aws_subnet.private-1.id
          arn               = aws_subnet.private-1.arn
          availability_zone = aws_subnet.private-1.availability_zone
          cidr_block        = aws_subnet.private-1.cidr_block
        }
        2 = {
          id                = aws_subnet.private-2.id
          arn               = aws_subnet.private-2.arn
          availability_zone = aws_subnet.private-2.availability_zone
          cidr_block        = aws_subnet.private-2.cidr_block
        }
        3 = {
          id                = aws_subnet.private-3.id
          arn               = aws_subnet.private-3.arn
          availability_zone = aws_subnet.private-3.availability_zone
          cidr_block        = aws_subnet.private-3.cidr_block
        }
      }
      restricted = {
        ids = [
          aws_subnet.restricted-1.id,
          aws_subnet.restricted-2.id,
          aws_subnet.restricted-3.id
        ]
        1 = {
          id                = aws_subnet.restricted-1.id
          arn               = aws_subnet.restricted-1.arn
          availability_zone = aws_subnet.restricted-1.availability_zone
          cidr_block        = aws_subnet.restricted-1.cidr_block
        }
        2 = {
          id                = aws_subnet.restricted-2.id
          arn               = aws_subnet.restricted-2.arn
          availability_zone = aws_subnet.restricted-2.availability_zone
          cidr_block        = aws_subnet.restricted-2.cidr_block
        }
        3 = {
          id                = aws_subnet.restricted-3.id
          arn               = aws_subnet.restricted-3.arn
          availability_zone = aws_subnet.restricted-3.availability_zone
          cidr_block        = aws_subnet.restricted-3.cidr_block
        }
      }
      public = {
        ids = [
          aws_subnet.public-1.id,
          aws_subnet.public-2.id,
          aws_subnet.public-3.id
        ]
        1 = {
          id                = aws_subnet.public-1.id
          arn               = aws_subnet.public-1.arn
          availability_zone = aws_subnet.public-1.availability_zone
          cidr_block        = aws_subnet.public-1.cidr_block
        }
        2 = {
          id                = aws_subnet.public-2.id
          arn               = aws_subnet.public-2.arn
          availability_zone = aws_subnet.public-2.availability_zone
          cidr_block        = aws_subnet.public-2.cidr_block
        }
        3 = {
          id                = aws_subnet.public-3.id
          arn               = aws_subnet.public-3.arn
          availability_zone = aws_subnet.public-3.availability_zone
          cidr_block        = aws_subnet.public-3.cidr_block
        }
      }
    }

    vpc = {
      id         = aws_vpc.this.id
      arn        = aws_vpc.this.arn
      cidr_block = aws_vpc.this.cidr_block
      owner_id   = aws_vpc.this.owner_id
      name       = local.vpc.name
      abbr       = local.vpc.abbr
      machine    = local.vpc.machine
    }

    vpc_endpoint = {
      dynamodb = {
        id = aws_vpc_endpoint.dynamodb.id
      }
      s3 = {
        id = aws_vpc_endpoint.s3.id
      }
    }

  }
}

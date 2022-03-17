resource "aws_route" "internet_gateway-public-1" {
  route_table_id         = aws_route_table.public-1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
  provider               = aws.this
}

resource "aws_route" "internet_gateway-public-2" {
  route_table_id         = aws_route_table.public-2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
  provider               = aws.this
}

resource "aws_route" "internet_gateway-public-3" {
  route_table_id         = aws_route_table.public-3.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
  provider               = aws.this
}

resource "aws_route" "internet_gateway-restricted-1" {
  count                  = (var.enable_igw_on_restricted_subnets ? 1 : 0)
  route_table_id         = aws_route_table.restricted-1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
  provider               = aws.this
}

resource "aws_route" "internet_gateway-restricted-2" {
  count                  = (var.enable_igw_on_restricted_subnets ? 1 : 0)
  route_table_id         = aws_route_table.restricted-2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
  provider               = aws.this
}

resource "aws_route" "internet_gateway-restricted-3" {
  count                  = (var.enable_igw_on_restricted_subnets ? 1 : 0)
  route_table_id         = aws_route_table.restricted-3.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
  provider               = aws.this
}

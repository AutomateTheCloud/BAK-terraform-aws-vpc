#------------------------------------------------------------------------------
# Subnet - Private - 1
resource "aws_subnet" "private-1" {
  cidr_block              = cidrsubnet("${var.network_ip_network}/${var.network_ip_netmask}", 3, 0)
  availability_zone       = var.network_availability_zones[0]
  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = false
  tags = merge(
    local.tags,
    map(
      "Name", "${local.vpc.abbr}-private-1-${local.aws.region.abbr}",
      "Network", "private",
      "NetworkLocation", "az1"
    )
  )
  provider = aws.this
}

#------------------------------------------------------------------------------
# Subnet - Private - 2
resource "aws_subnet" "private-2" {
  cidr_block              = cidrsubnet("${var.network_ip_network}/${var.network_ip_netmask}", 3, 1)
  availability_zone       = var.network_availability_zones[1]
  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = false
  tags = merge(
    local.tags,
    map(
      "Name", "${local.vpc.abbr}-private-2-${local.aws.region.abbr}",
      "Network", "private",
      "NetworkLocation", "az2"
    )
  )
  provider = aws.this
}

#------------------------------------------------------------------------------
# Subnet - Private - 3
resource "aws_subnet" "private-3" {
  cidr_block              = cidrsubnet("${var.network_ip_network}/${var.network_ip_netmask}", 3, 2)
  availability_zone       = var.network_availability_zones[2]
  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = false
  tags = merge(
    local.tags,
    map(
      "Name", "${local.vpc.abbr}-private-3-${local.aws.region.abbr}",
      "Network", "private",
      "NetworkLocation", "az3"
    )
  )
  provider = aws.this
}

#------------------------------------------------------------------------------
# Subnet - Restricted - 1
resource "aws_subnet" "restricted-1" {
  cidr_block              = cidrsubnet("${var.network_ip_network}/${var.network_ip_netmask}", 3, 3)
  availability_zone       = var.network_availability_zones[0]
  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = false
  tags = merge(
    local.tags,
    map(
      "Name", "${local.vpc.abbr}-restricted-1-${local.aws.region.abbr}",
      "Network", "restricted",
      "NetworkLocation", "az1"
    )
  )
  provider = aws.this
}

#------------------------------------------------------------------------------
# Subnet - Restricted - 2
resource "aws_subnet" "restricted-2" {
  cidr_block              = cidrsubnet("${var.network_ip_network}/${var.network_ip_netmask}", 3, 4)
  availability_zone       = var.network_availability_zones[1]
  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = false
  tags = merge(
    local.tags,
    map(
      "Name", "${local.vpc.abbr}-restricted-2-${local.aws.region.abbr}",
      "Network", "restricted",
      "NetworkLocation", "az2"
    )
  )
  provider = aws.this
}

#------------------------------------------------------------------------------
# Subnet - Restricted - 3
resource "aws_subnet" "restricted-3" {
  cidr_block              = cidrsubnet("${var.network_ip_network}/${var.network_ip_netmask}", 3, 5)
  availability_zone       = var.network_availability_zones[2]
  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = false
  tags = merge(
    local.tags,
    map(
      "Name", "${local.vpc.abbr}-restricted-3-${local.aws.region.abbr}",
      "Network", "restricted",
      "NetworkLocation", "az3"
    )
  )
  provider = aws.this
}

#------------------------------------------------------------------------------
# Subnet - Public - 1
resource "aws_subnet" "public-1" {
  cidr_block              = cidrsubnet("${var.network_ip_network}/${var.network_ip_netmask}", 4, 12)
  availability_zone       = var.network_availability_zones[0]
  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = true
  tags = merge(
    local.tags,
    map(
      "Name", "${local.vpc.abbr}-public-1-${local.aws.region.abbr}",
      "Network", "public",
      "NetworkLocation", "az1"
    )
  )
  provider = aws.this
}

#------------------------------------------------------------------------------
# Subnet - Public - 2
resource "aws_subnet" "public-2" {
  cidr_block              = cidrsubnet("${var.network_ip_network}/${var.network_ip_netmask}", 4, 13)
  availability_zone       = var.network_availability_zones[1]
  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = true
  tags = merge(
    local.tags,
    map(
      "Name", "${local.vpc.abbr}-public-2-${local.aws.region.abbr}",
      "Network", "public",
      "NetworkLocation", "az2"
    )
  )
  provider = aws.this
}

#------------------------------------------------------------------------------
# Subnet - Public - 3
resource "aws_subnet" "public-3" {
  cidr_block              = cidrsubnet("${var.network_ip_network}/${var.network_ip_netmask}", 4, 14)
  availability_zone       = var.network_availability_zones[2]
  vpc_id                  = aws_vpc.this.id
  map_public_ip_on_launch = true
  tags = merge(
    local.tags,
    map(
      "Name", "${local.vpc.abbr}-public-3-${local.aws.region.abbr}",
      "Network", "public",
      "NetworkLocation", "az3"
    )
  )
  provider = aws.this
}

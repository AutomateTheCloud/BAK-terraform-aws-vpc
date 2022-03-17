resource "aws_vpc" "this" {
  cidr_block           = "${var.network_ip_network}/${var.network_ip_netmask}"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(
    local.tags,
    map(
      "Name", "${local.vpc.abbr}-${local.aws.region.abbr}"
    )
  )
  provider = aws.this
}

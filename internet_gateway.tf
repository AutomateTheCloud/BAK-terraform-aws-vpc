resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = merge(
    local.tags,
    map(
      "Name", "${local.vpc.abbr}-${local.aws.region.abbr}"
    )
  )
  provider = aws.this
}

# This does not work correctly on the first execution of the plan
# You must apply the plan a second time before this kicks in.
# Will look into fixing this, but I suspect its an issue with
# the AWS provider.
resource "aws_default_route_table" "this" {
  default_route_table_id = aws_vpc.this.default_route_table_id

  tags = merge(
    local.tags,
    map(
      "Name", "${local.vpc.abbr}-default-${local.aws.region.abbr}",
      "Active", "false",
      "Note", "DO NOT USE OR MODIFY"
    )
  )
  provider = aws.this
}

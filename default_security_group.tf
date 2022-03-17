resource "aws_default_security_group" "this" {
  vpc_id = aws_vpc.this.id
  tags = merge(
    local.tags,
    map(
      "Name", "vpc-${local.vpc.abbr}-default-${local.aws.region.abbr}",
      "Note", "DO NOT USE OR MODIFY"
    )
  )
  depends_on = [
    aws_vpc.this
  ]
  provider = aws.this
}

resource "aws_flow_log" "s3" {
  count                = (var.vpc_flow_log_enable_s3 ? 1 : 0)
  log_destination      = data.aws_s3_bucket.flow_log[0].arn
  log_destination_type = "s3"
  traffic_type         = var.vpc_flow_log_traffic_type
  vpc_id               = aws_vpc.this.id
  tags                 = local.tags
  provider             = aws.this
}

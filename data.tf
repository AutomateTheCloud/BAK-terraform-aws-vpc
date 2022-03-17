data "aws_s3_bucket" "flow_log" {
  count    = (var.vpc_flow_log_enable_s3 ? 1 : 0)
  bucket   = var.vpc_flow_log_s3_bucket
  provider = aws.this
}

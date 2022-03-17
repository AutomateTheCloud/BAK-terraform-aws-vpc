resource "aws_kms_key" "this" {
  description             = "Data Encryption Key for ${local.vpc.name}"
  deletion_window_in_days = 10
  enable_key_rotation     = true
  tags = merge(
    local.tags
  )
  provider = aws.this
}
resource "aws_kms_alias" "this" {
  name          = "alias/data-${local.vpc.abbr}"
  target_key_id = aws_kms_key.this.key_id
  provider      = aws.this
}

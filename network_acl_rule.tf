resource "aws_network_acl_rule" "private-ingress" {
  count          = var.network_acl_ingress_use_default_all == true ? 1 : 0
  network_acl_id = aws_network_acl.private.id
  rule_number    = 1000
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
  provider       = aws.this
}

resource "aws_network_acl_rule" "private-egress" {
  count          = var.network_acl_egress_use_default_all == true ? 1 : 0
  network_acl_id = aws_network_acl.private.id
  egress         = true
  rule_number    = 1000
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
  provider       = aws.this
}

resource "aws_network_acl_rule" "restricted-ingress" {
  count          = var.network_acl_ingress_use_default_all == true ? 1 : 0
  network_acl_id = aws_network_acl.restricted.id
  rule_number    = 1000
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
  provider       = aws.this
}

resource "aws_network_acl_rule" "restricted-egress" {
  count          = var.network_acl_egress_use_default_all == true ? 1 : 0
  network_acl_id = aws_network_acl.restricted.id
  egress         = true
  rule_number    = 1000
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
  provider       = aws.this
}

resource "aws_network_acl_rule" "public-ingress" {
  count          = var.network_acl_ingress_use_default_all == true ? 1 : 0
  network_acl_id = aws_network_acl.public.id
  rule_number    = 1000
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
  provider       = aws.this
}

resource "aws_network_acl_rule" "public-egress" {
  count          = var.network_acl_egress_use_default_all == true ? 1 : 0
  network_acl_id = aws_network_acl.public.id
  egress         = true
  rule_number    = 1000
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
  provider       = aws.this
}

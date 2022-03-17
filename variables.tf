variable "enable_igw_on_restricted_subnets" {
  description = "Enable IGW routing on Restricted Subnets"
  type        = bool
  default     = false
}

variable "network_availability_zones" {
  description = "Network Availability Zones (3 zones required)"
  type        = list
  default     = []
}

variable "network_acl_egress_use_default_all" {
  description = "Network ACL Egress: Use Default All"
  type        = bool
  default     = false
}

variable "network_acl_ingress_use_default_all" {
  description = "Network ACL Ingress: Use Default All"
  type        = bool
  default     = false
}

variable "network_ip_netmask" {
  description = "Network IP netmask"
  type        = number
  default     = "16"
}

variable "network_ip_network" {
  description = "Network IP network CIDR"
  type        = string
  default     = "172.16.0.0"
}

variable "vpc_flow_log_enable_s3" {
  description = "Enable VPC Flow Log collection to S3 Bucket"
  type        = bool
  default     = false
}

variable "vpc_flow_log_s3_bucket" {
  description = "VPC Flow Log: S3 Bucket"
  type        = string
  default     = ""
}

variable "vpc_flow_log_traffic_type" {
  description = "VPC Flow Log: Traffic Type (ACCEPT, REJECT, ALL)"
  type        = string
  default     = "ALL"
}

variable "vpc_name" {
  description = "VPC Name"
  type        = string
  default     = ""
}

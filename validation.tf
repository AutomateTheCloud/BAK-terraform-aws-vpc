resource "null_resource" "validation-network_availability_zones" {
  count = (length(var.network_availability_zones) == 3 ? 0 : "invalid") # ERROR: Invalid number of Availability Zones (should be 3)
}

resource "null_resource" "validation-vpc_name" {
  count = (var.vpc_name != "" ? 0 : "invalid") # ERROR: VPC Name not specified
}

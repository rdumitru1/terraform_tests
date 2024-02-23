locals {
  vpc_cidr = "11.241.64.0/20"
  nat_gateway_count = var.single_nat_gateway ? 1 : (
    var.one_nat_gateway_per_az ? length(var.azs) : var.max_subnet_length
    )
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 3, k)]
  for_each = local.azs
}
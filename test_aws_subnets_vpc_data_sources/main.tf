locals {
  subnets = data.aws_subnets.app_subnets
  vpc = data.aws_vpcs.vpc.ids
  vpc1 = data.aws_vpc.vpc1
}

# resource "local_file" "for_each_loop" {
#   for_each = local.subnets
#   content = "${each.key}"
#   filename = "${path.module}/${each.key}.foreach"
# }


/*
for_each = var.one_pub_sub_per_az || var.create_custom_pub_sub ? {
    for rule in var.public_inbound_nacl_rules : rule.rule_number => rule
    } : toset([])
    */

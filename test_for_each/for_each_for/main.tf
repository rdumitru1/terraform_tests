locals {
  azs = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  public_inbound_nacl_rules = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_block  = "0.0.0.0/0"
    }
  ]
}

resource "local_file" "for_each_for_loop" {
  for_each = {
    for index, az in sort(slice(local.azs, 0, 3)) : az => {
      az    = az
      index = index
    }
  }
  content  = each.value.az
  filename = "${path.module}/${each.key}.for_each_for"
}

resource "local_file" "for_each_list_of_maps" {
  for_each = {
    for rule in local.public_inbound_nacl_rules : rule.rule_number => rule
  }
  content  = each.value.rule_number
  filename = "${path.module}/${each.key}.for_each_for_loop"
}


/*
for_each = var.one_pub_sub_per_az || var.create_custom_pub_sub ? {
    for rule in var.public_inbound_nacl_rules : rule.rule_number => rule
    } : toset([])
    */

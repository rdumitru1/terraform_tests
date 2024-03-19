data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}

locals {
  account_id = try(data.aws_caller_identity.current.account_id, "")
  partition  = try(data.aws_partition.current.partition, "")
}

data "aws_iam_policy_document" "name" {
  statement {
    sid     = "Default"
    actions = ["kms:*"]
    resources = ["*"]

    principals {
      type = "AWS"
      identifiers = ["arn:${local.partition}:iam::${local.account_id}:root"]
    }
  }
}

resource "aws_kms_key" "name" {
  bypass_policy_lockout_safety_check = false               #var.bypass_policy_lockout_safety_check (false)
  customer_master_key_spec           = "SYMMETRIC_DEFAULT" #var.customer_master_key_spec (SYMMETRIC_DEFAULT)
  deletion_window_in_days            = "7"                 #var.deletion_window_in_days (10)
  description                        = "test"              #var.description (description)
  enable_key_rotation                = false               #var.enable_key_rotation (yes)
  is_enabled                         = true                #var.is_enabled (true)
  key_usage                          = "ENCRYPT_DECRYPT"   #var.key_usage (ENCRYPT_DECRYPT)
  multi_region                       = false               #var.multi_region (false)
  policy                             = data.aws_iam_policy_document.name.json
}

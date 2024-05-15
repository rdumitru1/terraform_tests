data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_iam_policy_document" "kms_policy" {
  statement {
    sid       = "Default"
    actions   = ["kms:*"]
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = ["arn:${local.partition}:iam::${local.account_id}:root"]
    }
  }
}

resource "aws_efs_file_system" "efs_fs" {
  count = length(var.creation_token)

  creation_token                  = element(var.creation_token, "${count.index}")
  encrypted                       = var.encrypted
  kms_key_id                      = var.ca_efs_kms_key_arn
  provisioned_throughput_in_mibps = var.performance_mode == "provisioned" ? var.provisioned_throughput_in_mibps : null
  performance_mode                = var.performance_mode

  dynamic "lifecycle_policy" {
    for_each = var.lifecycle_policy == null ? [] : var.lifecycle_policy
    iterator = policy

    content {
      transition_to_ia                    = policy.value.transition_to_ia
      transition_to_primary_storage_class = policy.value.transition_to_primary_storage_class
    }
  }

  tags = merge(
    local.mandatory_tags,
    {
      "Name" = var.creation_token[count.index]
    }
  )
}

resource "aws_efs_access_point" "efs_ap" {
  count = length(var.creation_token)

  file_system_id = aws_efs_file_system.efs_fs[count.index].id

  dynamic "posix_user" {
    for_each = var.posix_user == null ? [] : var.posix_user
    iterator = user

    content {
      gid            = user.value.gid
      secondary_gids = try(user.value.secondary_gids, null)
      uid            = user.value.uid
    }
  }

  dynamic "root_directory" {
    for_each = var.root_directory == null ? [] : var.root_directory
    iterator = dir

    content {
      path = dir.value.path

      dynamic "creation_info" {
        for_each = dir.value.creation_info != null ? [dir.value.creation_info] : []
        iterator = info

        content {
          owner_gid   = info.value.owner_gid
          owner_uid   = info.value.owner_uid
          permissions = info.value.permissions
        }
      }
    }
  }

  tags = merge(
    local.mandatory_tags,
    {
      "Name" = var.creation_token[count.index]
    }
  )
}

resource "aws_security_group" "efs_sg" {
  name        = "${var.efs_sg_name}-sg"
  description = "Security Group for DocumentDB cluster"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.sg_ingress_rules
    iterator = rule
    content {
      from_port       = rule.value.from_port
      to_port         = rule.value.to_port
      protocol        = rule.value.protocol
      security_groups = rule.value.security_groups
      self            = rule.value.self
      description     = rule.value.description
      cidr_blocks     = rule.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.sg_egress_rules
    iterator = rule
    content {
      from_port   = rule.value.from_port
      to_port     = rule.value.to_port
      protocol    = rule.value.protocol
      cidr_blocks = rule.value.cidr_blocks
    }
  }

  tags = merge(
    local.mandatory_tags,
    {
      "Name" = "jenkins_efs_sg"
    }
  )
}
resource "aws_efs_mount_target" "alpha" {
  count = length(var.app_subnet_ids)

  file_system_id = aws_efs_file_system.efs_fs[0].id
  subnet_id      = element(var.app_subnet_ids, "${count.index}")
  security_groups = [for sg in tolist([aws_security_group.efs_sg.id]) : sg]
}

resource "aws_efs_mount_target" "alpha" {
  count = length(var.app_subnet_ids)

  file_system_id = aws_efs_file_system.efs_fs[0].id
  subnet_id      = element(var.app_subnet_ids, count.index)
  security_groups = [aws_security_group.efs_sg.id]
}
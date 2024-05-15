data "aws_eks_cluster" "cluster_oidc" {
  name = "NONPROD-K8S"
}

data "aws_partition" "current" {}

data "aws_caller_identity" "current" {}

# data "aws_eks_cluster" "cluster_arn" {
#   name = var.cluster_name
# }

data "aws_iam_policy_document" "web_identity" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringLike"
      variable = "${replace(data.aws_eks_cluster.cluster_oidc.identity.0.oidc.0.issuer, "https://", "")}:sub"
      values = [
        "system:serviceaccount:*:*"
      ]
    }

    condition {
      test     = "StringLike"
      variable = "${replace(data.aws_eks_cluster.cluster_oidc.identity.0.oidc.0.issuer, "https://", "")}:aud"
      values = [
        "sts.amazonaws.com"
      ]
    }

    principals {
      identifiers = [local.oidc_arn]
      type        = "Federated"
    }
  }
}

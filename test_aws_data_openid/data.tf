# data "aws_iam_openid_connect_provider" "example" {
#   arn = "arn:aws:iam::594630546012:oidc-provider/oidc.eks.eu-west-1.amazonaws.com/id/43675C6389269F5AFE7572BA10B9B9CD"
# }

data "aws_eks_cluster" "cluster_oidc" {
  name = "NONPROD-K8S"
}

data "aws_eks_cluster" "cluster_arn" {
  name = "NONPROD-K8S"
}

data "aws_partition" "current" {}

data "aws_caller_identity" "current" {}


locals {
  # openid = data.aws_iam_openid_connect_provider.example.arn
  eks_id     = data.aws_eks_cluster.cluster_oidc.identity
  eks_arn    = data.aws_eks_cluster.cluster_arn.arn
  account_id = data.aws_caller_identity.current.account_id
  partition  = data.aws_partition.current.partition
  oidc = "${replace(data.aws_eks_cluster.cluster_oidc.identity.0.oidc.0.issuer, "https:/", "")}"
  oidc_arn = "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:oidc-provider${local.oidc}"
}

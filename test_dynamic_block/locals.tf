locals {
  prefix = "NONPROD-K8S-app"
  partition = data.aws_partition.current.partition
  account_id = data.aws_caller_identity.current.account_id
  policy_resources_prefix = "arn:${local.partition}:secretsmanager:eu-west-1:${local.account_id}:"
  oidc = "${replace(data.aws_eks_cluster.cluster_oidc.identity.0.oidc.0.issuer, "https:/", "")}"
  oidc_arn = "arn:${data.aws_partition.current.partition}:iam::${data.aws_caller_identity.current.account_id}:oidc-provider${local.oidc}"
  app = var.applications
}
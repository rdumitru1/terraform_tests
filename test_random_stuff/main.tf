data "aws_subnets" "application" {
  filter {
    name   = "vpc-id"
    values = ["vpc-047cfe182a92400ab"]
  }

  tags = {
    Tier = "Application"
  }
}
locals {
  efs = {
    jenkins_efs = {
      encrypted                       = true
      performance_mode                = "generalPurpose"
      throughput_mode                 = "bursting"
      provisioned_throughput_in_mibps = ""
    }
  }
  app = data.aws_subnets.application.ids
}

resource "docker_registry_image" "name" {
  name                 = "eks/aws-load-balancer-controller:v2.6.2"
  insecure_skip_verify = true
}

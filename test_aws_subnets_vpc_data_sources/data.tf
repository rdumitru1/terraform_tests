data "aws_subnets" "app_subnets" {
  filter {
    name   = "tag:Name"
    values = ["Application*"]
  }
}

data "aws_vpcs" "vpc" {
  tags = {
    Name = "VPC.Res.1"
  }
}

data "aws_vpc" "vpc1" {
  tags = {
    Name = "VPC.Res.1"
  }
}
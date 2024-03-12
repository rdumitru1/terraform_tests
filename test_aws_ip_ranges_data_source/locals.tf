locals {
  s3_ip_ranges = data.aws_ip_ranges.european_ec2.cidr_blocks
}
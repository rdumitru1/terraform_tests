data "aws_ip_ranges" "european_ec2" {
  regions  = ["eu-west-1"]
  services = ["s3"]
}
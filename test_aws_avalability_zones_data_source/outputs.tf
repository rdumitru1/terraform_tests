output "av_zones" {
  value = slice(data.aws_availability_zones.available.names, 0, 3)
}
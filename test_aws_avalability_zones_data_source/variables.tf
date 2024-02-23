variable "single_nat_gateway" {
  type = bool
  default = false
}

variable "one_nat_gateway_per_az" {
  type = bool
  default = false
}

variable "azs" {
  type = list(string)
  # default = ["azs1", "azs2"]
  default = []
}

variable "max_subnet_length" {
  type = number
  default = 100
}
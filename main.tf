variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "vpc_subnets" {
  #default = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
  default = ["10.0.0.0/20"]
}

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "subnet" {
  for_each   = toset(var.vpc_subnets)
  cidr_block = each.value
  vpc_id     = aws_vpc.vpc.id
}
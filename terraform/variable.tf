variable "instance_type" {
  default = "m7i-flex.large"
}

variable "key_name" {
  default = "terra"
}

#########################
# Default VPC
#########################

data "aws_vpc" "default" {
  default = true
}
# /* COMMON */

# provider "aws" {
#   access_key  = "AKIAU2WPBSKD5QKJB7A2"
#   secret_key = "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"
#   region = "eu-west-1"

# }

variable "region" {
  default = "us-west-2"
}

variable "vpc_cidr" {
  default = "10.20.0.0/16"
}

variable "public_subnet_cidr" {
  type = "list"
  default = ["10.20.10.0/24","10.20.20.0/24","10.20.30.0/24"]
}

variable "private_subnet_cidr" {
  type = "list"
  default = ["10.20.50.0/24","10.20.60.0/24","10.20.70.0/24"]
}

# variable "azs" {
#   type = "list"
#   default = ["eu-west-1a","eu-west-1b","eu-west-1c"]
# }
# /* COMMON */

provider "aws" {
  access_key  = "AKIAU2WPBSKD5QKJB7A2"
  secret_key = "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"
  region = "eu-west-1"

}

resource "aws_vpc" "tf-bru-vpc" {
  cidr_block = "${var.vpc_cidr}"

  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
  instance_tenancy = "default"

  tags = {
    Name = "tf-bru-vpc"
  }
 
}

resource "aws_subnet" "public-subnets" {
  count = "${length(var.public_subnet_cidr)}"
  vpc_id = "${aws_vpc.tf-bru-vpc.id}"
  cidr_block = "${element(var.public_subnet_cidr,count.index)}"

  tags = {
    Name = "tf-bru-pub-${count.index}"
  }

}

resource "aws_internet_gateway" "tf-bru-ig" {
  vpc_id = "${aws_vpc.tf-bru-vpc.id}"

  tags = {
    Name = "tf-bru-ig"
  }
}

resource "aws_subnet" "private-subnets" {
  count = "${length(var.private_subnet_cidr)}"
  vpc_id = "${aws_vpc.tf-bru-vpc.id}"
  cidr_block = "${element(var.private_subnet_cidr,count.index)}"

  tags = {
    Name = "tf-bru-priv-${count.index}"
  }

}

# resource "aws_route_table" "tf-bru-pub-rt" {
#   vpc_id = "${aws_vpc.tf-bru-vpc.id}"

#   route {
#     cidr_block = "0.0.0.0/0" // Internet access
#     gateway_id = "${aws_internet_gateway.tf-bru-ig.id}"
#   }

#   tags = {
#     Name = "tf-bru-pub-rt"
#   }
# }


# resource "aws_instance" "tf-ec1" {
#   ami = "ami-0bb3fad3c0286ebd5"
#   instance_type = "t2.micro"
#   key_name = "bru-key" 

#   #subnet_ids = "${aws_subnet.public-subnets}"
# }
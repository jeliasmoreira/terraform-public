# Declaracao do vpc
resource "aws_vpc" "cloudprep-vpc" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true
 
 tags = {
    Name = "${var.vpc_name}"
    Method = "${var.terraform}"
  }

}

resource "aws_subnet" "public_subnet" {
  vpc_id     = "${aws_vpc.cloudprep-vpc.id}"
  cidr_block = "${var.cidr_east-1a}"
  availability_zone = "sa-east-1a"
  map_public_ip_on_launch ="true"

  tags = {
    Name = "pubSubNet_cloudprep"
    Method = "${var.terraform}"

  }
}
resource "aws_subnet" "private_subnet" {
  vpc_id     = "${aws_vpc.cloudprep-vpc.id}"
  cidr_block = "${var.cidr_east-1c}"
  availability_zone = "sa-east-1c"
  map_public_ip_on_launch ="true"

tags = {
    Name = "privSubNet_cloudprep"
    Method = "${var.terraform}"

  }

}
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.cloudprep-vpc.id}"

  tags = {
    Name = "igw_cloudprep"
    Method = "${var.terraform}"

  }
}
resource "aws_route_table" "rt_public_cloudprep" {
  vpc_id = "${aws_vpc.cloudprep-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
tags = {
    Name = "rt_public_cloudprep"
    Method = "${var.terraform}"
  }
}
#resource "aws_route_table" "rt_private_cloudprep" {
#  vpc_id = "${aws_vpc.cloudprep-vpc.id}"
#
#  route {
#    cidr_block = "${var.vpc_cidr}"
#    gateway_id = "${aws_internet_gateway.igw.id}"
#  }
#tags = {
#    Name = "rt_public_cloudprep"
#    Method = "${var.terraform}"
#  }
#}

resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.rt_public_cloudprep.id}"
}

#resource "aws_route_table_association" "rta_subnet_private" {
#  subnet_id      = "${aws_subnet.private_subnet.id}"
#  route_table_id = "${aws_route_table.rt_private_cloudprep.id}"
#}
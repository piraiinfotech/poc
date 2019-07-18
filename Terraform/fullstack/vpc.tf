
data "aws_availability_zones" "zones"{}


resource "aws_vpc" "main" {
  cidr_block = "${var.AWS_VPC_MAIN_CIDR}"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"

  tags ={
    Name = "${var.PROJECT_NAME}"
  }
  
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${var.AWS_VPC_PUBLIC_SUBNET1_CIDR}"
  availability_zone = "${data.aws_availability_zones.zones.names[0]}"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "${var.PROJECT_NAME}-PUBLIC_SUBNET_1"
  }
  }

resource "aws_subnet" "public_subnet_2" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${var.AWS_VPC_PUBLIC_SUBNET2_CIDR}"
  availability_zone = "${data.aws_availability_zones.zones.names[1]}"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "${var.PROJECT_NAME}-PUBLIC_SUBNET_2"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${var.AWS_VPC_PRIVATE_SUBNET1_CIDR}"
  availability_zone = "${data.aws_availability_zones.zones.names[0]}"
  tags = {
    Name = "${var.PROJECT_NAME}-PRIVATE_SUBNET_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id = "${aws_vpc.main.id}"
  cidr_block = "${var.AWS_VPC_PRIVATE_SUBNET2_CIDR}"
  availability_zone = "${data.aws_availability_zones.zones.names[1]}"
  tags = {
    Name = "${var.PROJECT_NAME}-PRIVATE_SUBNET_2"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"
tags = {
    Name = "${var.PROJECT_NAME}-IGW"
  }
}

resource "aws_eip" "eip" {
  vpc = "true"
  depends_on = ["aws_internet_gateway.igw"]
}


resource "aws_nat_gateway" "ngw" {
  allocation_id = "${aws_eip.eip.id}"
  subnet_id = "${aws_subnet.public_subnet_1.id}"
  depends_on = ["aws_internet_gateway.igw"]
  tags = {
    Name = "${var.PROJECT_NAME}-NGW"
  }
  }

resource "aws_route_table" "public_route" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
  tags = {
    Name = "${var.PROJECT_NAME}-public-route-table"
  }
  
}
resource "aws_route_table" "private_route" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.ngw.id}"
  }
  tags = {
    Name = "${var.PROJECT_NAME}-private-route-table"
  }
  
}


resource "aws_route_table_association" "public_subnet_1" {
  subnet_id = "${aws_subnet.public_subnet_1.id}"
  route_table_id = "${aws_route_table.public_route.id}"
}

resource "aws_route_table_association" "public_subnet_2" {
  subnet_id = "${aws_subnet.public_subnet_2.id}"
  route_table_id = "${aws_route_table.public_route.id}"
}

resource "aws_route_table_association" "private_subnet_1" {
  subnet_id = "${aws_subnet.private_subnet_1.id}"
  route_table_id = "${aws_route_table.private_route.id}"
}

resource "aws_route_table_association" "private_subnet_2" {
  subnet_id = "${aws_subnet.private_subnet_2.id}"
  route_table_id = "${aws_route_table.private_route.id}"
}



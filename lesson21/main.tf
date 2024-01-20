provider "aws" {
  region = var.region
}

resource "aws_vpc" "my_vpc"{
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    name = "my_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.public_subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    name = "my_public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = var.private_subnet_cidr
}

resource "aws_internet_gateway" "my_igw"{
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "public_rt"{
  vpc_id = aws_vpc.my_vpc.id
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id = aws_subnet.public_subnet.id
}

resource "aws_security_group" "my_sg" {
  name = "my_sg"
  vpc_id = aws_vpc.my_vpc.id
  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins-controller" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags = {
    Name = "jenkins-controller"
    Environment = "prod"
    Role = "jenkins"
  }
}

resource "aws_instance" "app-server" {
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  tags = {
    Name = "app-server"
    Environment = "prod"
    Role = "application"
  }
}
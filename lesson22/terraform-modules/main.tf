terraform {
  backend "s3" {
    bucket = "rd-laba-state-bucket"
    dynamodb_table = "state-table"
    key = "terraform.tfstate"
    encrypt = true
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}
data "aws_ami" "latest_ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

module "my_vpc" {
  source = "./modules/vpc"

  vpc_name = "RD-VPC"
  vpc_cidr = "10.0.0.0/16"
  av_zone = ["us-east-2a", "us-east-2b"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}
module "monitoring_vpc" {
  source = "./modules/vpc"

  vpc_name = "MONITORING-VPC"
  vpc_cidr = "10.0.0.0/16"
  av_zone = ["us-east-2a", "us-east-2b"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "sg" {
  source = "./modules/security_group"

  name_sg = "public-sg"
  cidr_blocks = "0.0.0.0/0"
  from_port = 22
  to_port = 22
  vpc_id = module.my_vpc.vpc_id
}

module "monitoring_sg" {
  source = "./modules/security_group"

  name_sg = "public-monitoring-sg"
  cidr_blocks = "0.0.0.0/0"
  from_port = 22
  to_port = 22
  vpc_id = module.monitoring_vpc.vpc_id
}

module "app" {
  source = "./modules/ec2-instance"

  ami = data.aws_ami.latest_ubuntu.id
  instance_env = "core"
  instance_name = "app-instance"
  instance_role = "app"
  instance_type = "t2.micro"
  subnet_id = module.my_vpc.public_subnet_ids[0]
  security_groups_name = module.sg.sg_id
}
module "monitoring" {
  source = "./modules/ec2-instance"

  ami = data.aws_ami.latest_ubuntu.id
  instance_env = "core"
  instance_name = "monitoring-instance"
  instance_role = "monitoring"
  instance_type = "t2.micro"
  subnet_id = module.monitoring_vpc.public_subnet_ids[0]
  security_groups_name = module.monitoring_sg.sg_id
}
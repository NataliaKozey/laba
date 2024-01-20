variable "region" {
  description = "AWS Region"
  type = string
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type = string
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR"
  type = string
}

variable "ami_id" {
  description = "Ubuntu 22"
  type = string
}

variable "instance_type" {
  description = "Instance type"
  type = string
}
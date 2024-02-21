variable "name_sg" {
  description = "The name of the SG"
  type = string
}

variable "vpc_id" {
  description = "The VPC ID"
  type = string
}

variable "from_port" {
  description = "The start range of inbound port rule"
  type = number
}

variable "to_port" {
  description = "The end range of inbound port rule"
  type = number
}

variable "cidr_blocks" {
  description = "The CDR for inbound traffic"
  type = string
}
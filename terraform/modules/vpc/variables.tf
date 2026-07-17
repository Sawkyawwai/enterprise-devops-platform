variable "vpc_name" {
  description = "VPC Name"
  type        = string
}

variable "cidr_block" {
  description = "VPC CIDR Block"
  type        = string
}

variable "environment" {
  description = "Environment Name"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone"
  type        = string
}

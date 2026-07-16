variable "vpc_cidr" {
  description = "Development VPC CIDR"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "availability_zone" {
  type = string
}

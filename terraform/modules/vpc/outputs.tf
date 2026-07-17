output "vpc_id" {

  description = "VPC ID"

  value = aws_vpc.this.id

}

output "vpc_cidr" {

  description = "VPC CIDR"

  value = aws_vpc.this.cidr_block

}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.this.id
}


resource "aws_security_group" "this" {

  name        = var.security_group_name
  description = "Security Group for Enterprise DevOps Platform"

  vpc_id = var.vpc_id

  tags = {
    Name        = var.security_group_name
    Environment = var.environment
    ManagedBy   = "Terraform"
    Project     = "Enterprise DevOps Platform"
  }

}

resource "aws_vpc_security_group_ingress_rule" "ssh" {

  security_group_id = aws_security_group.this.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 22

  ip_protocol = "tcp"

  to_port = 22

}

resource "aws_vpc_security_group_ingress_rule" "http" {

  security_group_id = aws_security_group.this.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 80

  ip_protocol = "tcp"

  to_port = 80

}

resource "aws_vpc_security_group_ingress_rule" "https" {

  security_group_id = aws_security_group.this.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 443

  ip_protocol = "tcp"

  to_port = 443

}

resource "aws_vpc_security_group_ingress_rule" "jenkins" {

  security_group_id = aws_security_group.this.id

  cidr_ipv4 = "0.0.0.0/0"

  from_port = 8080

  ip_protocol = "tcp"

  to_port = 8080

}

resource "aws_vpc_security_group_egress_rule" "all" {

  security_group_id = aws_security_group.this.id

  cidr_ipv4 = "0.0.0.0/0"

  ip_protocol = "-1"

}



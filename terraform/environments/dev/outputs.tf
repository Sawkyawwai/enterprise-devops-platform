output "instance_public_ip" {
  description = "EC2 Public IP"
  value       = module.ec2.public_ip
}

output "instance_private_ip" {
  description = "EC2 Private IP"
  value       = module.ec2.private_ip
}

output "instance_id" {
  description = "EC2 Instance ID"
  value       = module.ec2.instance_id
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

# outputs.tf
output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.main.id
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "target_group_arn" {
  description = "ARN of the Target Group"
  value       = aws_lb_target_group.main.arn
}

output "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.main.name
}

output "asg_instance_ids" {
  description = "List of instance IDs in the ASG"
  value       = aws_autoscaling_group.main.instances[*].id
}

output "ec2_public_ips" {
  description = "Public IPs of EC2 instances in the ASG"
  value       = [
    for instance in aws_autoscaling_group.main.instances : instance.public_ip
  ]
}

output "key_name" {
  description = "Name of the created key pair"
  value       = aws_key_pair.deployer.key_name
}

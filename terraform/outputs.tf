# Add this data source to get ASG instances
data "aws_instances" "asg_instances" {
  filter {
    name = "tag:aws:autoscaling:groupName"
    values = [aws_autoscaling_group.main.name]
  }

  instance_state_names = ["running"]
  depends_on = [aws_autoscaling_group.main]
}

# Outputs
output "vpc_id" {
  value = aws_vpc.main.id
  description = "ID of the VPC"
}

output "subnet_ids" {
  value = aws_subnet.public[*].id
  description = "IDs of the public subnets"
}

output "security_group_id" {
  value = aws_security_group.main.id
  description = "ID of the security group"
}

output "alb_dns_name" {
  value = aws_lb.main.dns_name
  description = "DNS name of the Application Load Balancer"
}

output "ec2_public_ips" {
  description = "Public IPs of EC2 instances in the ASG"
  value = data.aws_instances.asg_instances.public_ips
}

# Optional: Add ASG name output for reference
output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value = aws_autoscaling_group.main.name
}

# Optional: Add target group ARN output
output "target_group_arn" {
  description = "ARN of the ALB target group"
  value = aws_lb_target_group.main.arn
}

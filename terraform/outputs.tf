output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = aws_subnet.public[*].id
}

output "security_group_id" {
  value = aws_security_group.main.id
}

output "alb_dns_name" {
  value = aws_lb.main.dns_name
}

output "ec2_public_ips" {
  description = "Public IPs of EC2 instances in the ASG"
  value = [
    for instance in aws_autoscaling_group.main.instances : aws_instance.example[instance].public_ip
  ]
}

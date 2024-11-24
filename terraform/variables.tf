# variables.tf
variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "flask-app"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-05c13eab67c5d8861"  # Amazon Linux 2023 AMI in us-east-1
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = "t2.micro"
}

variable "docker_image" {
  description = "Docker image to run on the instances"
  type        = string
}

variable "key_name" {
  description = "Name of the AWS key pair"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key for EC2 instances"
  type        = string
}

variable "asg_desired_capacity" {
  description = "Desired capacity for ASG"
  type        = number
  default     = 1
}

variable "asg_max_size" {
  description = "Maximum size for ASG"
  type        = number
  default     = 2
}

variable "asg_min_size" {
  description = "Minimum size for ASG"
  type        = number
  default     = 1
}

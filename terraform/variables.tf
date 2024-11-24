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
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
}

variable "docker_image" {
  description = "Docker image to run on the instances"
  type        = string
}

variable "asg_desired_capacity" {
  description = "Desired capacity for ASG"
  type        = 1
}

variable "asg_max_size" {
  description = "Maximum size for ASG"
  type        = 2
}

variable "asg_min_size" {
  description = "Minimum size for ASG"
  type        = 1
}

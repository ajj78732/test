variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "key_name" {
  description = "SSH key pair name"
  default     = "jenkins-ec2-key"
}

variable "docker_image" {
  description = "Docker image to deploy"
}
variable "min_size" {
  default = 2
  description = "Minimum number of instances in the auto-scaling group"
}

variable "max_size" {
  default = 2
  description = "Maximum number of instances in the auto-scaling group"
}

variable "desired_capacity" {
  default = 1
  description = "Desired number of instances in the auto-scaling group"
}

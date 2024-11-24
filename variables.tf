variable "aws_region" {
  description = "AWS region for resources"
  default     = "us-east-1"
}

variable "docker_image" {
  description = "Docker image to deploy"
}

variable "key_name" {
  description = "Key name for EC2 instance SSH access"
}

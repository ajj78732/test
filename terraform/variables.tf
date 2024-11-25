variable "aws_region" {}
variable "key_name" {}
variable "ssh_public_key" {}
variable "project_name" {}
variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "instance_type" { default = "t2.micro" }
variable "ami_id" {}
variable "docker_image" {}
variable "asg_desired_capacity" { default = 1 }
variable "asg_max_size" { default = 2 }
variable "asg_min_size" { default = 1 }
variable "deployment_mode" {
  description = "Deployment mode (apply or destroy)"
  type        = string
  default     = "apply"
  validation {
    condition     = contains(["apply", "destroy"], var.deployment_mode)
    error_message = "Deployment mode must be either 'apply' or 'destroy'."
  }
}

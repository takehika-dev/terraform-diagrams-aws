variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "ap-northeast-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = "ami-026c39f4021df9abe"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

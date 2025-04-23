output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public.id
}

output "web_instance_ids" {
  description = "IDs of the web server instances"
  value       = [aws_instance.web.id]
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket created"
  value       = aws_s3_bucket.terraform_demo.bucket
}

output "ec2_iam_role_name" {
  description = "Name of the IAM Role for EC2"
  value       = aws_iam_role.ec2_s3_role.name
}

output "used_ami_id" {
  description = "The AMI ID used for the EC2 instance"
  value       = aws_instance.web.ami
}

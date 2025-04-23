resource "aws_instance" "web" {
  # count = 1
  ami           = var.ami_id != "" ? var.ami_id : data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    # Name = "web-server-${count.index + 1}"
    Name = "web-server-demo"
  }

  depends_on = [
    aws_iam_role_policy_attachment.ec2_s3_attach,
    aws_internet_gateway.gw
  ]
}

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

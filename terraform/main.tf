
resource "aws_instance" "app_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_pair

  tags = {
    Name = "NodeAppInstance3"
  }

  # Enable public IP address
  associate_public_ip_address = true

  # Security group allowing SSH and HTTP
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  # User data to install Node.js on the instance automatically
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y gcc-c++ make
              curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
              sudo yum install -y nodejs
              EOF
}

# Security Group
resource "aws_security_group" "app_sg" {
  name        = "app_security_group_unique4"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = "vpc-0e4b9c9310698f115"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



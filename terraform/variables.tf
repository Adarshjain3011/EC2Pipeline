
// Define input variables such as AWS credentials, EC2 instance type, and AMI.

variable "aws_access_key" {
  type        = string
  description = "AWS access key"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret access key"
}

variable "instance_type" {
  type        = string
  description = "Type of EC2 instance"
  default     = "t2.micro"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instance"
  default     = "ami-0261f1947c4a84e09" # Ubuntu 20.04 LTS (ap-south-1)
}


variable "key_pair" {
  type        = string
  description = "EC2 Key Pair"
}



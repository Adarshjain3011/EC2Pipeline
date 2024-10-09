
// Configure the AWS provider to use with Terraform.

provider "aws" {
  region     = "ap-south-1"   # Specify your region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}



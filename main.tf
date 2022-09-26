provider "aws" {
  region  = "us-east-1"
  AWS_ACCESS_KEY_ID = $ACCESS_KEY
  AWS_SECRET_ACCESS_KEY = $SECRET_ACCESS
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.8.0"
    }
  }
}

variable "ec2_name" {
  default = "flugel"
}

variable "ec2_type" {
  default = "t2.micro"
}

variable "ec2_ami" {
  default = "ami-0742b4e673072066f"
}

resource "aws_instance" "tf-ec2" {
  ami           = var.ec2_ami
  instance_type = var.ec2_type
  key_name      = "firstkey"
  tags = {
    Name = "${var.ec2_name}-instance"
  }
}

output "tf-example-public_ip" {
  value = aws_instance.tf-ec2.public_ip
}

output "tf_example_private_ip" {
  value = aws_instance.tf-ec2.private_ip
}

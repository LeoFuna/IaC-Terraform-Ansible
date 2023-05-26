terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = var.region_aws
}

resource "aws_instance" "app_server" {
  user_data_replace_on_change = true
  ami           = "ami-03f65b8614a860c29"
  instance_type = var.instance
  key_name = var.key
  # user_data = "${file("user_data.sh")}"
  tags = {
    Name = "Terraform Ansible Python"
  }
}

resource "aws_key_pair" "chaveSSH" {
  key_name = var.key
  public_key = file("${var.key}.pub")
}

output "IP_publico" {
  value = aws_instance.app_server.public_ip
}

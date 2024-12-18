terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  cloud {
    organization = "poc-and-devops"
    workspaces {
      name = "learn-terraform-github-actions"
    }
  }
}

provider "aws" {
  region = "us-east-1"  # Cambiamos a us-east-1 que es la región por defecto en AWS Academy
}

resource "aws_instance" "app_server" {
  ami           = "ami-0e731c8a588258d0d"  # Amazon Linux 2023 AMI para us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
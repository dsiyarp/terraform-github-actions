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
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-07dfed28fcf95241c"  # Amazon Linux 2 AMI en us-west-2
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
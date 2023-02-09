terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.53.0"
    }
  }
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
}


variable "subnet_cidr_block" {
  description = "subnet cidr block"
}

variable "availability_zone" {
  description = "name of availability zone"
}
variable "enviroment" {
  description = "name of enviroment"
}
provider "aws" {
    region = "us-east-1"
}
resource "aws_vpc" "duke-vpc" {
  cidr_block = "10.0.0.0/16"
  
  tags {
      Name = "vpc-id"
  }
}  
resource "aws_subnet" "dev-subnet-1" {
  vpc_id   = aws_vpc.duke-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "dev-subnet-1"
  }
}
output "dev-vpc-id" {
  value = aws_vpc.duke-vpc.id
}
output "dev-subnet-id" {
  value = aws_subnet.dev-subnet-1.id
}
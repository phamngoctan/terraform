provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_vpc" "myVPC1" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_vpc" "myVPC2" {
  cidr_block = "192.168.0.0/24"
}

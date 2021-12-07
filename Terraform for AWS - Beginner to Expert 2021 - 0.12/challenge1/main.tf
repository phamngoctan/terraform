provider "aws" {
  region = "ap-southeast-1"
}

variable "myChallengeVPCName" {
  type = string
  default = "my challenge VPC name"
}

resource "aws_vpc" "TerraformVPC" {
  cidr_block = "192.168.0.0/24"
  tags = {
    "name" = var.myChallengeVPCName
  }
}
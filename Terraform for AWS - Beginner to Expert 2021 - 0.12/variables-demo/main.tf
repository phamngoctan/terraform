provider "aws" {
  region = "ap-southeast-1"
}

variable "numberOfServers" {
  type = number
}

resource "aws_instance" "myEC2" {
  ami = "ami-0dc5785603ad4ff54"
  instance_type = "t2.micro"
  count = var.numberOfServers
}

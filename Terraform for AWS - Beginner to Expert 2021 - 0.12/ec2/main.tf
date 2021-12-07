provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "ec2" {
  ami = "ami-0dc5785603ad4ff54"
  instance_type = "t2.micro"
  tags = {
    name = "my ec2 name"
  }
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "myEC2" {
  ami = "ami-0dc5785603ad4ff54"
  instance_type = "t2.micro"
  tags = {
    name = "my ec2 name"
  }
}

resource "aws_eip" "elasticEip" {
  instance = aws_instance.myEC2.id
}

output "EIP" {
  value = aws_eip.elasticEip.public_ip
}
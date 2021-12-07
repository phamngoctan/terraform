variable "ec2Name" {
  type = string
  description = "ec2 name"
}

resource "aws_instance" "ec2" {
  ami = "ami-0dc5785603ad4ff54"
  instance_type = "t2.micro"
  tags = {
    Name = var.ec2Name
  }
}

output "instanceId" {
  value = aws_instance.ec2.id
}

output "instancePublicIp" {
  value = aws_instance.ec2.public_ip
}
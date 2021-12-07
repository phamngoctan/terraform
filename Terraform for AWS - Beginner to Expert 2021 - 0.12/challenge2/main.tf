provider "aws" {
  region = "ap-southeast-1"
}

variable "ingressRules" {
  type = list(number)
  default = [ 22, 80, 443 ]
}

resource "aws_instance" "myEC2" {
  ami = "ami-0dc5785603ad4ff54"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.webtraffic.name ]
  user_data = file("server-service.sh")
  tags = {
    name = "my ec2 from challenge 2"
  }
}

resource "aws_security_group" "webtraffic" {
  name        = "test-sg-challenge-2"
  description = "VPC sg for challenge 2"
  vpc_id      = "vpc-064f59efd6d2cdfd5" # please change it to your current vpc id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressRules
    content {
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow connection from port ${port.value}"
      from_port   = port.value
      protocol    = "tcp"
      to_port     = port.value
    }
  }

  egress = [{
    description = "All out going traffic is enabled"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids = []
    security_groups = []
    self        = true
  }]
}

resource "aws_eip" "elasticEip" {
  instance = aws_instance.myEC2.id
  depends_on = [
    aws_instance.myEC2
  ]
}

output "fixedPrivateIpForECS" {
  value = aws_eip.elasticEip.private_ip
}

output "fixedPublicIpForECS" {
  value = aws_eip.elasticEip.public_ip
}

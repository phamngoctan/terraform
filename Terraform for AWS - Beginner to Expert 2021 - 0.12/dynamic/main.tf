provider "aws" {
  region = "ap-southeast-1"
}

variable "ingressRules" {
  type = list(number)
  default = [ 80, 443 ]
}

variable "egressRules" {
  type = list(number)
  default = [ 80, 443, 25, 3306, 53, 8080 ]
}

resource "aws_instance" "myEC2" {
  ami = "ami-0dc5785603ad4ff54"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.webtraffic.name ]
  tags = {
    name = "my ec2 name"
  }
}

resource "aws_security_group" "webtraffic" {
  name        = "test-demo-sg"
  description = "VPC sg for demo"
  vpc_id      = "vpc-064f59efd6d2cdfd5" # please change it to your current vpc id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressRules
    content {
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow connections"
      from_port   = port.value
      protocol    = "tcp"
      to_port     = port.value
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self        = true
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressRules
    content {
      description = "All out going traffic is enabled"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self        = true
    }
  }
}
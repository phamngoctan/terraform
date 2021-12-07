provider "aws" {
  region = "ap-southeast-1"
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

  ingress = [{
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow ssh connection"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids = []
    security_groups = []
    self        = true
    }, {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow web access"
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids = []
    security_groups = []
    self        = true
  }]

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
variable "ingressRules" {
  type = list(number)
  default = [ 22, 80, 443 ]
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

output "name" {
  value = aws_security_group.webtraffic.name
}
variable "instance_id" {
  type = string
  description = "the corresponding EC2 instance id need to be mapped with static IP address"
}

resource "aws_eip" "elasticEip" {
  instance = var.instance_id
}

output "eipPublicIP" {
  value = aws_eip.elasticEip.public_ip
}

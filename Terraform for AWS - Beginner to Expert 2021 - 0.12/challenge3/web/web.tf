resource "aws_instance" "webEC2" {
  ami = "ami-0dc5785603ad4ff54"
  instance_type = "t2.micro"
  security_groups = [ module.securitygroup.name ]
  user_data = file("${path.module}/server-service.sh")
  tags = {
    Name = "my ec2 for web from challenge 3"
  }
}

module "eip" {
  source = "../eip"
  instance_id = aws_instance.webEC2.id
}

module "securitygroup" {
  source = "../securitygroup"
}

output "fixedPrivateIpForECSWeb" {
  value = aws_instance.webEC2.private_ip
}

output "fixedPublicIpForECSWeb" {
  value = aws_instance.webEC2.public_ip
}

output "eipPublicIp" {
  value = module.eip.eipPublicIP
}

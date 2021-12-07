variable "serverNames" {
  type = list(string)
}

resource "aws_instance" "DBEC2" {
  ami = "ami-0dc5785603ad4ff54"
  instance_type = "t2.micro"
  count = length(var.serverNames)
  tags = {
    Name = var.serverNames[count.index]
  }
}

output "privateIPs" {
  value = [aws_instance.DBEC2.*.private_ip]
}

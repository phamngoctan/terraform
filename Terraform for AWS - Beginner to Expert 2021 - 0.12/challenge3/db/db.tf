resource "aws_instance" "DBEC2" {
  ami = "ami-0dc5785603ad4ff54"
  instance_type = "t2.micro"
  tags = {
    Name = "DB Server"
  }
}

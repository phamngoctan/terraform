provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "myRequiredDB" {
  ami = "ami-0dc5785603ad4ff54"
  instance_type = "t2.micro"
}

resource "aws_instance" "web" {
  ami = "ami-0dc5785603ad4ff54"
  instance_type = "t2.micro"
  depends_on = [
    aws_instance.myRequiredDB
  ]
}

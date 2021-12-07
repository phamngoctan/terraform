provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_instance" "web" {
  ami = "ami-0dc5785603ad4ff54"
  instance_type = "t2.micro"
  tags = {
    "Name" = "Web Server"
  }
  depends_on = [
    aws_instance.myRequiredDB
  ]
}

resource "aws_instance" "myRequiredDB" {
  ami = "ami-0dc5785603ad4ff54"
  instance_type = "t2.micro"
  tags = {
    "Name" = "DB Server"
  }
}

data "aws_instance" "dbSearch" {
  filter {
    name = "tag:Name"
    values = ["DB Server"]
  }
}

output "dbServers" {
  value = data.aws_instance.dbSearch.availability_zone
}

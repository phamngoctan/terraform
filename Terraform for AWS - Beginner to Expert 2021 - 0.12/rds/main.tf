provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_db_instance" "mysqlInstance" {
  name = "myDb"
  identifier = "my-first-rds"
  instance_class = "db.t2.micro"
  engine = "mysql"
  engine_version = "8.0.23"
  username = "bob"
  password = "password123"
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true
}
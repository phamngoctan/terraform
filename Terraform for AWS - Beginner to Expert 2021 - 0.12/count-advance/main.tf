provider "aws" {
  region = "ap-southeast-1"
}

module "db" {
  source = "./db"
  serverNames = ["mariadb", "mysql", "mssql"]
}

output "privateIPs" {
  value = module.db.privateIPs
}
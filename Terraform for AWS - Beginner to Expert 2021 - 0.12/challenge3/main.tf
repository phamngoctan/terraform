provider "aws" {
  region = "ap-southeast-1"
}

module "db" {
  source = "./db"
}

module "web" {
  source = "./web"
}

output "fixedPrivateIpForECSWeb" {
  value = module.web.fixedPrivateIpForECSWeb
}

output "fixedPublicIpForECSWeb" {
  value = module.web.fixedPublicIpForECSWeb
}

output "eipPublicIP" {
  value = module.web.eipPublicIp
}

provider "aws" {
  region = "ap-southeast-1"
}

module "ec2module" {
  source = "./ec2"
  ec2Name = "Name from module"
}

output "module_output" {
  value = module.ec2module.instanceId
}

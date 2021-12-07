provider "aws" {
  region = "ap-southeast-1"
}

variable "vpcname" {
  type = string
  default = "myvpc"
}

variable "sshport" {
  type = number
  default = 22
}

variable "enabled" {
  type = bool
  default = true
}

variable "mylist" {
  type = list(string)
  default = [ "value1", "value2" ]
}

variable "mymap" {
  type = map
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}

variable "inputName" {
  type =  string
  description = "set the name of the VPC"
}

resource "aws_vpc" "myFirstVpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    fromStringType = var.vpcname
    fromListType = var.mylist[0]
    fromMapType = var.mymap["key1"]
    fromInputName = var.inputName
  }
}

output "vpcid" {
  value = aws_vpc.myFirstVpc.id
}

variable "myTuple" {
  type = typle([string, number, string])
  default = ["cat", 1, "dog"]
}

variable "myObject" {
  type = object({name = string, port = list(number)})
  default = {
    name = "Tan Pham"
    port = [ 22, 80 ]
  }
}

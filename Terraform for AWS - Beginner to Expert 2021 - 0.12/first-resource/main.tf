provider "aws" {
  region = "ap-southeast-1"
}

# remember the name myFirstVpc is used internally inside Terrform
# it is not the name of the AWS vpc :)
resource "aws_vpc" "myFirstVpc" {
  cidr_block = "10.0.0.0/16"
}
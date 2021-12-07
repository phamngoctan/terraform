terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate" # folder path
    bucket = "tanpn2021" # provide your s3 bucket name here
    region = "ap-southeast-1"
  }
}
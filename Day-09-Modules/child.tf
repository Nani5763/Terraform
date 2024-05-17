provider "aws" {
    region = "ap-south-1"
  
}
module "aws_instance" {

    source = "./module"
    ami = "ami-0cc9838aa7ab1dce7"
    instance_type = "t2.micro"
    key_name = "Second-key"
    name = "Pavan"

  
}
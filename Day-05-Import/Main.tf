provider "aws" {
  
}
resource "aws_instance" "Pavan" {
    ami = "ami-07caf09b362be10b8"
    instance_type = "t3.micro"
    tags = {
      Name = "Manual Instance"
    }
}
provider "aws" {
    region = "ap-south-1"
  
}
resource "aws_instance" "web" {
    ami = "ami-0cc9838aa7ab1dce7"
    instance_type = "t2.micro"
    key_name = "Second-key"
    user_data = file("test.sh")
    tags = {
      Name = "Web-Instance"
    }
  
}
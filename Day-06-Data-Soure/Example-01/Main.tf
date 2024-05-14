resource "aws_instance" "dev" {
    ami = "ami-07caf09b362be10b8"
    instance_type = "t2.micro"
    key_name = "first-key"
    associate_public_ip_address = true
    security_groups = [ data.aws_security_group.dev.id ]
    subnet_id = data.aws_subnet.dev.id
    tags = {
      Name = "dev.ec2"
    }
  
}

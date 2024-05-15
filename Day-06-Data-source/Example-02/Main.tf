resource "aws_instance" "dev" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    key_name = "Second-key"
    associate_public_ip_address = true
    security_groups = [data.aws_security_group.dev.id]
    subnet_id = data.aws_subnet.dev-01.id
    tags = {
      Name = "Hardcoded-Instance"
    }
    
  
}


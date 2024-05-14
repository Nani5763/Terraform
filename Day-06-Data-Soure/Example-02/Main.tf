resource "aws_instance" "Pavan" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.Pavan.id
    security_groups = [ "data.aws_security_group.Pavan.id" ]
    tags = {
      Name = "Hardcoding"
    }
}


resource "aws_security_group" "Pavan" {
  name        = "Pavan"
  vpc_id      = data.aws_vpc.Pavan.id
  tags = {
    Name = "dev_sg"
  }
 
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }



egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

}
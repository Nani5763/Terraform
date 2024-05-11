data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

data "aws_subnet" "Pavan" {
    filter {
      name = "tag:Name"
      values = ["mydevsub"]
    }
  
}
data "aws_vpc" "Pavan" {
    filter {
      name = "tag:Name"
      values = [cust_vpc]
    }
  
}

resource "aws_security_group" "dev" {
  name        = "allow_tls"
  vpc_id      = data.aws_vpc.vpc.id
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
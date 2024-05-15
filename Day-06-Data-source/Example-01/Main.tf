resource "aws_instance" "dev" {
    ami = "ami-0cc9838aa7ab1dce7"
    instance_type = "t2.micro"
    key_name = "Second-key"
    #security_groups = [ "aws_security_group.dev.id" ]
    tags = {
      Name = "Instanced-01"
    }

  
}

resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "vpc-01"
    }
  
}
resource "aws_subnet" "dev-01" {
    vpc_id = aws_vpc.dev.id
    availability_zone = "ap-south-1a"
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = "subnet-01"
    }  
}
resource "aws_security_group" "dev" {
    name = "allow_tls"
    vpc_id = aws_vpc.dev.id
    tags = {
        Name = "sg-pavan"
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
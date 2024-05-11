#Create VPC
resource "aws_vpc" "Pavan" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "Pavan"
    }
  
}
#Create Internet Gateway and attach to VPC
resource "aws_internet_gateway" "Pavan" {
    vpc_id = aws_vpc.Pavan.id
    tags = {
      Name = "Pavan"
    }
  
}
#Create subnet
resource "aws_subnet" "Pavan" {
    vpc_id = aws_vpc.Pavan.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "Pavan"
    }
  
}
#Create RouteTable and attach to Internet Gateway to RouteTable
resource "aws_route_table" "Pavan" {
    vpc_id = aws_vpc.Pavan.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Pavan.id
    }
    tags = {
      Name = "Pavan"
    }
  
}
#Subnet Association
resource "aws_route_table_association" "Pavan" {
    route_table_id = aws_route_table.Pavan.id
    subnet_id = aws_subnet.Pavan.id
    
  
}
#Create Security Group
resource "aws_security_group" "Pavan" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.Pavan.id
  tags = {
    Name = "Pavan_sg"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
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
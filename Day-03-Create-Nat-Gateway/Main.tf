#Create VPC
resource "aws_vpc" "Pavan" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "Pavan_VPC"
    }
  
}
#Create Internet Gateway
resource "aws_internet_gateway" "Pavan" {
    vpc_id = aws_vpc.Pavan.id
    tags = {
      Name = "Pavan-Int"
    }
  
}
#Create public Subnet
resource "aws_subnet" "public_Pavan" {
    vpc_id = aws_vpc.Pavan.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "Public-Subnet-01"
    }
  
}
#Create Private Subnet
resource "aws_subnet" "Private_Pavan" {
    vpc_id = aws_vpc.Pavan.id
    cidr_block = "10.0.2.0/24"
    tags = {
      Name = "Private-Subnet-01"
    }
  
}
#Create Elastic ip
resource "aws_eip" "Pavan" {
    domain = "vpc"
    tags = {
      Name = "Pavan-ELIP"
    }
  
}
#Create NAT Gateway and attach to 
resource "aws_nat_gateway" "Pavan" {
    subnet_id = aws_subnet.public_Pavan.id
    allocation_id = aws_eip.Pavan.id
    tags = {
      Name = "Pavan-NAT"
    }
  
}
#Create Route table and Attach to internet gateway to public route table
resource "aws_route_table" "Public-Pavan" {
    vpc_id = aws_vpc.Pavan.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Pavan.id
    }
    tags = {
      Name = "Public-RT"
    }

  
}
#Attach Nat Gateway to Private Route
resource "aws_route_table" "Private-Pavan" {
    vpc_id = aws_vpc.Pavan.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.Pavan.id
    }
    tags = {
        Name = "Private-RT"
    }

  
}
#Public RT association
resource "aws_route_table_association" "Public-Pavan" {
    subnet_id = aws_subnet.public_Pavan.id
    route_table_id = aws_route_table.Public-Pavan.id
  
}
#private RT association
resource "aws_route_table_association" "Private-Pavan" {
    route_table_id = aws_route_table.Private-Pavan.id
    subnet_id = aws_subnet.Private_Pavan.id
  
}
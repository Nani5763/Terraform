provider "aws" {
    region = "ap-south-1"
}

resource "aws_key_pair" "dev" {
    key_name = "Third-key"
    public_key = file("~/.ssh/id_ed25519.pub")
  
}

resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "vpc-01"
    }
  
}

resource "aws_subnet" "dev" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = "subnet-01"
    }
  
}
 resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id
    tags = {
      Name = "Pavan_int"
    }
   
 }

 resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id
   route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev.id
   }
   tags = {
     Name = "Pavan_RT"
   }
 }

 resource "aws_route_table_association" "dev" {
    subnet_id = aws_subnet.dev.id
    route_table_id = aws_route_table.dev.id
   
 }

 resource "aws_security_group" "dev" {
    name = "web"
    vpc_id = aws_vpc.dev.id

    ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Pavan-SG-01"
  }

}

resource "aws_instance" "Pavan" {
    ami = "ami-0cc9838aa7ab1dce7"
    instance_type = "t2.micro"
    key_name = aws_key_pair.dev.key_name
    subnet_id = aws_subnet.dev.id
    vpc_security_group_ids = [ aws_security_group.dev.id ]
    associate_public_ip_address = true
    tags = {
      Name = "Provisioners"
    }

    connection {
      user = "ec2-user"
      type = "ssh"
      private_key = file("~/.ssh/id_ed25519")
      host = self.public_ip
    }

    # local execution procee
    provisioner "local-exec" {
        command = "touch file57"
      
    }

    # File provisioner to copy a file from local to the remote EC2 instance
    provisioner "file" {
        source = "file10"
        destination = "/home/ec2-user/file10"
      
    }

     # remote execution process 
     provisioner "remote-exec" {
        inline = [ 
            "touch file457",
            "echo Hello chellii I love you Chellii >> file457",
            

         ]
        
       
     }
     provisioner "remote-exec" {
        inline = [ 
            "touch file463",
            "echo Hai Chellii I LOVE YOU >> file463",

         ]
       
     }


}

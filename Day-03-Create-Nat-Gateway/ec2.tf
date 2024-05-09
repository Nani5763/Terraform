resource "aws_instance" "Pavan" {
    ami = "ami-07caf09b362be10b8"
    instance_type = "t2.micro"
    key_name = "first-key"
    subnet_id = aws_subnet.public_Pavan.id
    associate_public_ip_address = true #Enable auto-assigning public IP
    tags = {
      Name = "Public-Instance-01"
    }
  
}
resource "aws_instance" "Private_Pavan" {
    ami = "ami-07caf09b362be10b8"
    instance_type = "t2.micro"
    key_name = "first-key"
    subnet_id = aws_subnet.Private_Pavan.id
    associate_public_ip_address = false #Disable auto-assigning Public IP
    tags = {
      Name = "Priavte-Instance-01"
    }
  
}
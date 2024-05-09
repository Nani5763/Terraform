resource "aws_instance" "Pavan" {
    ami = var.ami_id_Public
    instance_type = var.instance_type_01
    key_name = var.key_name_01
    subnet_id = aws_subnet.public_Pavan.id
    associate_public_ip_address = true #Enable auto-assigning public IP
    tags = {
      Name = "Public-Instance-01"
    }
  
}
resource "aws_instance" "Private_Pavan" {
    ami = var.ami_id_Private
    instance_type = var.instance_type_02
    key_name = var.key_name_02
    subnet_id = aws_subnet.Private_Pavan.id
    associate_public_ip_address = false #Disable auto-assigning Public IP
    tags = {
      Name = "Priavte-Instance-01"
    }
  
}
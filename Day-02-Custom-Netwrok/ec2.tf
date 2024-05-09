resource "aws_instance" "Pavan_dev" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = aws_subnet.Pavan.id
    tags = {
      Name = "Pavan_dev"
    }
  
}
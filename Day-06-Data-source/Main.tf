resource "aws_instance" "Pavan" {
    ami = data.aws_ami.amzlinux
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.Pavan.id
    security_groups = [ data.aws_security_group.Pavan.id ]

  
}
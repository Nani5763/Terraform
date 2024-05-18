#example1:without list varaible
#resource "aws_instance" "test" {
#   ami = "ami-0bb84b8ffd87024d8"
#   instance_type = "t2.micro"
#   key_name = "first-key"
#   count = 2

#   tags = {
#     Name = "Pavan-${count.index}"

#   }
  
#}



variable "ami_id" {
    type = string
    default = "ami-0bb84b8ffd87024d8"
  
}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}
variable "key_name" {
    type = string
    default = "first-key"
  
}
variable "Pavan" {
    type = list(string)
    default = ["dev","prod"]
  
}

resource "aws_instance" "dev" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    count = length(var.Pavan)

    tags = {
      Name = var.Pavan[count.index]
    }
  
}
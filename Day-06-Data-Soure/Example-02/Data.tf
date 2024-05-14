data "aws_vpc" "Pavan" {
    filter {
      name = "tag:Name"
      values = [ "Pavan" ]
    }
  
}
data "aws_subnet" "Pavan" {
    filter {
      name = "tag:Name"
      values = [ "Pavan" ]
    }
  
}

data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-ami-kernel-5.10-hvm-2.0.20240503.0-x86_64-gp2" ]
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

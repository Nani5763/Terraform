data "aws_security_group" "dev" {
    filter {
      name = "tag:Name"
      values = [ "sg-pavan" ]
    }
  
}

data "aws_vpc" "dev" {
    filter {
      name = "tag:Name"
      values = [ "vpc-01" ]
    }
  
}

data "aws_subnet" "dev-01" {
    filter {
      name = "tag:Name"
      values = [ "subnet-01" ]
    }
  
}

data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-x86_64-MATEDE_DOTNET-2023.10.12" ]
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


resource "aws_instance" "test" {
    ami = "ami-07caf09b362be10b8"
    instance_type = "t2.micro"
    key_name = "first-key"
  
}

resource "aws_s3_bucket" "test" {
    bucket = "njgyekdihdyuefmnb"
    depends_on = [aws_instance.test]
  
}
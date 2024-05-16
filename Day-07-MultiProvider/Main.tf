provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_s3_bucket" "dev" {
    bucket = "cuievklskdpdowdiehfub"   
}

provider "aws" {
    region = "us-east-1"
    alias = "America"
  
}

resource "aws_s3_bucket" "dev2" {
    bucket = "cjikljidibjsbcksjjknheu"
    provider = aws.America
  
}
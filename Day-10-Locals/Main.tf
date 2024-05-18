locals {
  bucket_name = "${var.layer}-${var.env}-bucket-pavan"
}

resource "aws_s3_bucket" "pavan" {
    # bucket = "dev-test-bucket"
    # bucket = "${var.layer}-${var.env}-bucket-pavan"
    bucket = local.bucket_name

    tags = {
       #Name = ${var.layer}-${var.env}-bucket-pavan
      Name = local.bucket_name
      Environment = var.env
    }
  
}
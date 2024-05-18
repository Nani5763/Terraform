resource "aws_instance" "dev" {
    ami = var.image_id
    instance_type = var.instance_type
    key_name = var.key_name
    iam_instance_profile = data.aws_iam_instance_profile.test.role_name

  
}
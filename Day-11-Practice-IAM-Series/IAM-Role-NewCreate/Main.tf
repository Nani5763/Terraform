#Create IAM Policy
resource "aws_iam_policy" "dev_policy" {
    name = "dev_policy"
    description = "permission for Ec2"
    policy = jsondecode({
	 "Version": "2012-10-17",
	  "Statement": [
		{
			
			"Effect": "Allow",
			"Action": "ec2:*",
			"Resource": "*"
		}
	   ]
    })
  
}

#Create IAM Role
resource "aws_iam_role" "test_role" {
  name = "test_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "Pavan_role"
  }
}

### Attach IAM policy to IAM role
resource "aws_iam_policy_attachment" "policy_example" {
    name = "policy_example"
    roles = [ aws_iam_role.test_role ]
    policy_arn = aws_iam_policy.dev_policy.arn
  
}
### Create instance profile using role
resource "aws_iam_instance_profile" "example-instance" {
    name = "example-instance"
    role = aws_iam_role.test_role.name
  
}
### Create EC2 instance and attache IAM role
resource "aws_instance" "dev" {
    ami = var.image-id
    instance_type = var.instance-type
    iam_instance_profile = aws_iam_instance_profile.example-instance.name
  
}
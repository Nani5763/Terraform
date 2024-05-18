# configured aws provider with proper credentials
provider "aws" {
    region = "ap-south-1"
  
}
# create an iam user
resource "aws_iam_user" "test" {
    name = "Pavan"
  
}
# give the iam user programatic access
resource "aws_iam_access_key" "test" {
    user = aws_iam_user.test.name
  
}
# create the inline policy
data "aws_iam_policy_document" "s3_get_put_detele_policy_document" {
  statement {
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject"
    ]

    resources = [
      "arn:aws:s3:::s3fullaccess777/*"
    ]
  }
}

# attach the policy to the user
resource "aws_iam_user_policy" "s3_get_put_detele_policy" {
  name   = "s3-get-put-delete"
  user   = aws_iam_user.test.name
  policy = data.aws_iam_policy_document.s3_get_put_detele_policy_document.json
}
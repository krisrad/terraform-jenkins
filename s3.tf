resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-jenkins-j347fskj45098"
  acl    = "private"

  tags = {
    Name = "Terraform state"
    "Project Name" = var.AWS_PROJECT_NAME
  }
}

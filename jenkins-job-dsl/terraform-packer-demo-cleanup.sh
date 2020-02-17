export AWS_ACCESS_KEY_ID="$aws_access_keyId"
export AWS_SECRET_ACCESS_KEY="$aws_secret_accessKey"
terraform init
aws s3 cp s3://terraform-state-j347fskj45098/amivar.tf amivar.tf
terraform destroy -auto-approve -target aws_instance.app-instance

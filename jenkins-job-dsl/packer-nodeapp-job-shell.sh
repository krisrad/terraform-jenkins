export AWS_ACCESS_KEY_ID="$aws_access_keyId"
export AWS_SECRET_ACCESS_KEY="$aws_secret_accessKey"
ARTIFACT=`packer build -machine-readable packer-demo.json |awk -F, '$0 ~/artifact,0,id/ {print $6}'`
AMI_ID=`echo $ARTIFACT | cut -d ':' -f2`
echo 'variable "APP_INSTANCE_AMI" { default = "'${AMI_ID}'" }' > amivar.tf
aws s3 cp amivar.tf s3://terraform-jenkins-j347fskj45098/amivar.tf

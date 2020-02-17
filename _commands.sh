cd 02-jenkins-packer-demo
ssh-keygen -f mykey
terraform init
terraform apply
create backend.tf
terraform init --yes --> #this will create and migrate backend to s3 bucket created by previous apply via s3.tf
ssh -i mykey ubuntu@<ip-of-ec2-instance>
df -h  --> #check volumes created and mounted for /var/lib/jenkins
ps uax | grep jenkins #check if jenkins is installed and running
browse to http://<ip.address>:8080
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
enter pswd and install suggested plugins and create admin user
# setup aws credentials in the box
su - jenkins
aws configure
aws s3 rm s3://terraform-state-j347fskj45098 --recursive

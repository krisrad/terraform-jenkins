resource "aws_instance" "jenkins-instance" {
  ami = var.AMIS_UBU_1604[var.AWS_REGION]
  instance_type = "t2.small"

  # the VPC subnet
  subnet_id = element(module.main-vpc.public_subnets, 0)

  # the security group
  vpc_security_group_ids = [aws_security_group.jenkins-securitygroup.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  # user data
  user_data = data.template_cloudinit_config.cloudinit-jenkins.rendered
  tags = {
    Name = "jenkins-server"
    "Project Name" = var.AWS_PROJECT_NAME
  }
}

resource "aws_ebs_volume" "jenkins-data" {
  availability_zone = "${var.AWS_REGION}a"
  size = 20
  type = "gp2"
  tags = {
    Name = "jenkins-data"
    "Project Name" = var.AWS_PROJECT_NAME
  }
}

resource "aws_volume_attachment" "jenkins-data-attachment" {
  device_name  = var.INSTANCE_DEVICE_NAME
  volume_id    = aws_ebs_volume.jenkins-data.id
  instance_id  = aws_instance.jenkins-instance.id
  skip_destroy = true
}

resource "aws_security_group" "jenkins-securitygroup" {
  vpc_id      = module.main-vpc.vpc_id
  name        = "jenkins-securitygroup"
  description = "security group that allows ssh and all egress traffic"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [local.workstation-external-cidr]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = [local.workstation-external-cidr]
  }
  tags = {
    Name = "jenkins-securitygroup"
    "Project Name" = var.AWS_PROJECT_NAME
  }
}

variable "AWS_ACCESS_KEY" {
  type = string
}
variable "AWS_SECRET_KEY" {
  type = string
}
variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AWS_PROJECT_NAME" {
  default = "terraform-jenkins-server"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS_UBU_1604" {
  type = map
  default = {
    us-east-1 = "ami-08bc77a2c7eb2b1da"
    us-east-2 = "ami-xxxxxxxxxxxxxxxxx"
  }
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "JENKINS_VERSION" {
  default = "2.204.1"
}

variable "TERRAFORM_VERSION" {
  default = "0.12.20"
}

variable "PACKER_VERSION" {
  default = "1.5.2"
}

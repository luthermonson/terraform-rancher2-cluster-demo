data "aws_vpc" "vpc" {
  id = "${var.vpcId}"
}

provider "aws" {
  region     = "${var.region}"
  access_key = "${var.accessKey}"
  secret_key = "${var.secretKey}"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

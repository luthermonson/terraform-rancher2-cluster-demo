data "aws_vpc" "vpc" {
  id = "${var.vpc_id}"
}

provider "aws" {
  region     = "${var.aws_region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
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

# provider "rancher2" {
#   api_url    = "${var.rancher_api_url}"
#   access_key = "${var.rancher2_access_key}"
#   secret_key = "${var.rancher2_secret_key}"
# }

# resource "rancher2_cluster" "rke" {
#   name        = "demo-cluster"
#   description = "TF created rke cluster"

#   rke_config {
#     cloud_provider {
#       name = "aws"
#     }
#   }
# }

variable "master" {
  type = "map"
  default = {
    "min_size"         = "1"
    "max_size"         = "1"
    "desired_capacity" = "1"
    "instance_type"    = "m5.large"
  }
}

variable "worker" {
  type = "map"
  default = {
    "min_size"         = "2"
    "max_size"         = "2"
    "desired_capacity" = "2"
    "instance_type"    = "m5.large"
  }
}

variable "node_command" {}
variable "cluster_name" {}
variable "aws_region" {}
variable "instance_profile" {}
variable "vpc_id" {}
variable "keyname" {}
variable "vpc_name" {}
variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "vpc_subnets" {}

variable "default_security_groups" {}
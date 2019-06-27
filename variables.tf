variable "desired_capacity" {}
variable "instance_type" {
  default = "t2.medium"
}
variable "node_command" {}
variable "roles" {}
variable "labels" {}
variable "pool_name" {}
variable "aws_region" {}
variable "instance_profile" {}
variable "vpc_id" {}
variable "keyname" {}
variable "accessKey" {}
variable "secretKey" {}

variable "vpc_subnets" {}

variable "default_security_groups" {}
variable "desired_capacity" {}
variable "instance_type" {
  default = "t2.medium"
}
variable "nodeCommand" {}
variable "roles" {}
variable "labels" {}
variable "nodePool" {}
variable "region" {}
variable "iamInstanceProfile" {}
variable "vpcId" {}
variable "keypairName" {}
variable "accessKey" {}
variable "secretKey" {}
variable "subnetId" {}
variable "securityGroup" {}

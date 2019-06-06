# Use for testing locally when you dont want to create/destroy
# a custom cluster by hand over and over again. Gen an api key and add 
# the variables and uncomment the rest.

# variable "rancher_api_url" {}
# variable "rancher2_access_key" {}
# variable "rancher2_secret_key" {}
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
# output "node_command" {
#   value = "${rancher2_cluster.rke.cluster_registration_token.0.node_command}"
# }
# output "kube_config" {
#   value = "${rancher2_cluster.rke.kube_config}"
# }
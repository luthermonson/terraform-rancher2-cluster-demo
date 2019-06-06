data "template_file" "master-user_data" {
  template = "${file("${path.module}/files/master_userdata.tmpl")}"

  vars = {
    node_command = "${var.node_command}" #"${rancher2_cluster.rke.cluster_registration_token.0.node_command}"
  }
}

resource "aws_launch_configuration" "master" {
  name_prefix          = "${var.vpc_name}-master"
  image_id             = "${data.aws_ami.ubuntu.image_id}"
  instance_type        = "${var.master["instance_type"]}"
  user_data            = "${data.template_file.master-user_data.rendered}"
  key_name             = "${var.keyname}"
  enable_monitoring    = false
  security_groups      = "${var.default_security_groups}"
  iam_instance_profile = "${var.instance_profile}"

  lifecycle {
    create_before_destroy = true
  }
  #depends_on = ["rancher2_cluster.rke"]
}

resource "aws_autoscaling_group" "master" {
  name                      = "${aws_launch_configuration.master.name}"
  launch_configuration      = "${aws_launch_configuration.master.name}"
  min_size                  = "${var.master["min_size"]}"
  max_size                  = "${var.master["max_size"]}"
  desired_capacity          = "${var.master["desired_capacity"]}"
  wait_for_elb_capacity     = "${var.master["desired_capacity"]}"
  vpc_zone_identifier       = "${var.vpc_subnets}"
  wait_for_capacity_timeout = "10m"
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.cluster_name}"
    value               = ""
    propagate_at_launch = true
  }
  tag {
    key                 = "Name"
    value               = "${var.vpc_name}-master"
    propagate_at_launch = true
  }
  #depends_on = ["rancher2_cluster.rke"]
}

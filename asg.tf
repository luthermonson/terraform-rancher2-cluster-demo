data "template_file" "user_data" {
  template = "${file("${path.module}/files/userdata.tmpl")}"

  vars = {
    node_command = "${var.node_command}"
    roles = "${var.roles}"
    labels = "${var.labels}"
  }
}

resource "aws_launch_configuration" "lc" {
  name_prefix          = "${var.pool_name}-"
  image_id             = "${data.aws_ami.ubuntu.image_id}"
  instance_type        = "${var.instance_type}"
  user_data            = "${data.template_file.user_data.rendered}"
  key_name             = "${var.keyname}"
  enable_monitoring    = false
  security_groups      = ["${var.default_security_groups}"]
  iam_instance_profile = "${var.instance_profile}"

  lifecycle {
    create_before_destroy = true
  }
  #depends_on = ["rancher2_cluster.rke"]
}

resource "aws_autoscaling_group" "asg" {
  name                      = "${aws_launch_configuration.lc.name}"
  launch_configuration      = "${aws_launch_configuration.lc.name}"
  min_size                  = "1"
  max_size                  = "${var.desired_capacity}"
  desired_capacity          = "${var.desired_capacity}"
  wait_for_elb_capacity     = "${var.desired_capacity}"
  vpc_zone_identifier       = ["${var.vpc_subnets}"]
  wait_for_capacity_timeout = "10m"
  lifecycle {
    create_before_destroy = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.pool_name}"
    value               = ""
    propagate_at_launch = true
  }
  tag {
    key                 = "Name"
    value               = "${var.pool_name}"
    propagate_at_launch = true
  }
  #depends_on = ["rancher2_cluster.rke"]
}

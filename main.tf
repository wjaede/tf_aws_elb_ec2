/* Setup our aws provider */
provider "aws" {
  access_key  = "${var.access_key}"
  secret_key  = "${var.secret_key}"
  region      = "${var.region}"
}
/*
   create a VPC Load balancer
*/
resource "aws_elb" "vpc" {
  name = "${var.app_name}"
  subnets = [ "${split(",", var.sbn_ids)}" ]
  security_groups =  [ "${split(",", var.sg_ids)}" ]

  listener {
    instance_port = "${var.listener.instance_port}"
    instance_protocol = "${var.listener.instance_protocol}"
    lb_port = "${var.listener.lb_portt}"
    lb_protocol = "${var.listener.lb_protocol}"
  }
  health_check {
    healthy_threshold = "${var.health_check.healthy_threshold}"
    unhealthy_threshold = "${var.health_check.unhealthy_threshold}"
    timeout = "${var.health_check.}"
    target = "${var.health_check.timeout}"
    interval = "${var.health_check.interval}"
  }

  instances = ["${split(",", var.instance_ids)}" ]
}

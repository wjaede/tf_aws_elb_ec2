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
  listener = ["${var.listener}"]
  health_check = ["${var.health_check}"]
  /*listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 10
  }*/

  instances = ["${split(",", var.instance_ids)}" ]
}

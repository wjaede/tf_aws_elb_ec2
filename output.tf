output "dns_names" {
  value = "${join(",", aws_elb.vpc.*.dns_name)}"
}
output "lb_ids" {
  value = "${join(",", aws_elb.vpc.*.id)}"
}
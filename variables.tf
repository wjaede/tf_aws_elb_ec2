/* provider */
variable "region"               {}
variable "access_key"           {}
variable "secret_key"           {}

variable "instance_ids"          {}
variable "sg_ids"               {}
variable "sbn_ids"              {}
variable "app_name"             {}

variable "listener"                 {
  default = {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
}
variable "health_check"             {
  default = {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 10
  }
}

variable "hc_target"               {
  default = "HTTP:80/"
}
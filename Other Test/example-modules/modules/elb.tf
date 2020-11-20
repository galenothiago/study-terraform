resource "aws_elb" "elb" {
  name = "${var.name}"
  security_groups = [ "${aws_security_group.sg.id}" ]
  cross_zone_load_balancing = true
  instances = ["${aws_instance.example.id}"]

  listener {
    instance_port = "80"
    instance_protocol = "tcp"
    lb_port = "80"
    lb_protocol = "tcp"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "TCP:80/check"
    interval = 5
  }
  tags {
    Name = "${var.name}"
    Environment = "${var.environment}"
  }
}
resource "aws_security_group" "appservers_alb"{
  name = "${var.PROJECT_NAME}-appservers-ALB"
  description = "Created by Peari Infotech"
  vpc_id      = "${aws_vpc.main.id}"

  tags={
    Name = "${var.PROJECT_NAME}-appservers-ALB"
  }

  ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["${aws_security_group.webservers_alb.id}"]

  }
  ingress{
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
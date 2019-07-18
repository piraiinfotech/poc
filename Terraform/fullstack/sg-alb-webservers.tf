resource "aws_security_group" "webservers_alb"{
  
  name = "${var.PROJECT_NAME}-webservers-ALB"
  description = "Created by Perai InfoTech"
  vpc_id      = "${aws_vpc.main.id}"
  
  tags={
    Name = "${var.PROJECT_NAME}-webservers-ALB"
  }
  

  ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

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

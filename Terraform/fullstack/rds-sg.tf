
resource "aws_security_group" "rds-sg" {
  vpc_id = "${aws_vpc.main.id}"
  name = "${var.PROJECT_NAME}-rds-sec-grp"

  ingress{
      from_port = "3306"
      to_port = "3306"
      protocol = "tcp"
      cidr_blocks = ["${var.CIDR_RDS}"]
  }

  egress{
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

}

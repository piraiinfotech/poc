resource "aws_db_instance" "rds_ins" {
  identifier = "${var.PROJECT_NAME}-rds-instance"
  allocated_storage = "${var.RDS_ALLOCATED_STORAGE}"
  storage_type = "gp2"
  engine = "${var.RDS_ENGINE}"
  engine_version = "${var.ENGINE_VERSION}"
  instance_class = "${var.DB_INSTANCE_CLASS}"
  backup_retention_period = "${var.BACKUP_RETENTION_PERIOD}"
  publicly_accessible = "${var.PUBLICLY_ACCESSIBLE}"
  username = "${var.RDS_USERNAME}"
  password = "${var.RDS_PASSWORD}"
  vpc_security_group_ids = ["${aws_security_group.rds-sg.id}"]
  db_subnet_group_name = "${aws_db_subnet_group.rds_subnet_group.name}"
  multi_az = "true"
 # depends_on = "${aws_security_group.rds-sg}"
}

resource "aws_db_subnet_group" "rds_subnet_group" {
    name          = "${var.PROJECT_NAME}_mysql_db_subnet_group"
    description   = "allowed subnets for mysql cluster instances"
    subnet_ids    = [
      "${aws_subnet.private_subnet_1.id}",
      "${aws_subnet.private_subnet_2.id}",
    ]

    tags = {
        Name = "${var.PROJECT_NAME}-rds-Subnet-Group"
    }
}

output "rds_end_point" {
  value = "${aws_db_instance.rds_ins.endpoint}"
}

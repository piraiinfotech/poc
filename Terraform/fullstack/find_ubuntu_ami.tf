data "aws_ami" "ubuntu"{
  most_recent = "true"
  owners = ["426093140332"]
  filter{
  name = "name"
  values = ["myUbuntuAMI"]
  }
 filter{
  name = "virtualization-type"
  values = ["hvm"]
 }
}
output "ubuntu22"{
  value = "${data.aws_ami.ubuntu.id}"
}

output "ec2_address_1" {
  value = "${aws_instance.web-server.public_ip}"
  } 
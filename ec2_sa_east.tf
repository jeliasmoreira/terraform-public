resource "aws_instance" "web-server" {
  ami                     = "${var.ami_webserver}"
  instance_type           = "t2.micro" 
  availability_zone       = "${var.aws_az1}"
  subnet_id               = "${aws_subnet.public_subnet.id}"
  key_name                = "${var.key_name}"
  
  disable_api_termination = "false" #Incrementa a segurança
  monitoring              = "true"
  security_groups         = ["${aws_security_group.web-sa-east-1.id}"]

  tags = {
  Name                    = "WebServer01"
  Envirioment             = "Production"
  ProvideBy               = "${var.terraform}"
  From                    = "aws-ami"
  }

 connection {
    host                  = "${self.public_ip}"
    user                  = "ec2-user"
    private_key           = "${file("./keys/webserver01.pem")}"
  }
 provisioner "remote-exec" {
    inline = [
    "sudo yum -y update && sudo yum -y install httpd git curl",
    "sudo cd /tmp/ && git clone ${var.app_git} && cd html_terraform && sudo mv index.html /var/www/html/ && sudo chown apache.apache /var/www/html/ ; sudo rm -rf /tmp/html_terraform", 
    "sudo systemctl start httpd",      
    ]
  }

 provisioner "local-exec" {

    command = "./check-status-http.sh ${self.public_ip}" 
  }
}
#create EC2 instance
resource "aws_instance" "my_web_instance" {
  ami                    = data.aws_ssm_parameter.webserver-ami.value
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.webserver-key.key_name
  vpc_security_group_ids = ["${aws_security_group.web_security_group.id}"]
  subnet_id              = aws_subnet.myvpc_public_subnet.id
  tags = {
    Name = "my_web_instance"
  }
  volume_tags = {
    Name = "my_web_instance_volume"
  }
  provisioner "remote-exec" { #install apache, mysql client, php
    inline = [
      "sudo mkdir -p /var/www/html/",
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo service httpd start",
      "sudo usermod -a -G apache ec2-user",
      "sudo chown -R ec2-user:apache /var/www",
      "sudo yum install -y mysql php php-mysql"
    ]
  }
  provisioner "file" { #copy the index file form local to remote
    source      = "index.php"
    destination = "/var/www/html/index.php"
  }
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = ""
    #copy <your_private_key>.pem to your local instance home directory
    #restrict permission: chmod 400 <your_private_key>.pem
    private_key = file("./key_name")
    host        = self.public_ip
  }
}

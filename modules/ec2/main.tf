data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners = [ "099720109477" ]

  filter {
    name = "name"
    values = [ "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" ]
  }
}

resource "aws_instance" "mini-projet-ec2" {
  ami = data.aws_ami.ubuntu_ami.id
  instance_type = var.instance_type
  key_name = var.ssh_key
  availability_zone = var.AZ
  security_groups = [ "${var.sg_name}" ]

  tags = {
    Name = "${var.maintainer}_ec2"
  }

  root_block_device {
    delete_on_termination = true
  }

  provisioner "local-exec" {
    command = "echo Publique IP: ${var.public_ip} >> ip_ec2.txt"
  }

  provisioner "remote-exec" {
    inline = [ 
        "sudo apt update -y",
        "sudo apt install -y nginx",
        "sudo systemctl start nginx",
        "sudo systemctl enable nginx"
     ]

     connection {
       type = "ssh"
       user = var.user
       private_key = file("C:/Users/m84285195/Documents/FORMATIONS/CLOUD/DevOps/Terraform/${var.ssh_key}.pem")
       host = self.public_ip
     }
  }
}
resource "aws_ebs_volume" "myvol" {
  availability_zone = var.AZ
  size = var.disk_size

  tags = {
    Name = "${var.maintainer}_ebs"
  }
}
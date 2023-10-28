resource "aws_ebs_volume" "myvol1" {
  availability_zone = var.AZ
  size = var.disk_size

  tags = {
    Name = "${var.maintainer}_ebs"
  }
}
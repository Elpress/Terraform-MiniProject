#resource "aws_eip" "my_eip" {
#  domain = vpc
#}

resource "aws_eip" "lb" {
    vpc = var.vpc
    instance = var.instance
    tags = var.tags
#    network_interface = var.network_interface
#    associate_with_private_ip = var.associate_with_private_ip
#    public_ipv4_pool = var.public_ipv4_pool
}
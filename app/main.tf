provider "aws" {
  region = "us-east-1"
  shared_credentials_files = ["C:Users/m84285195/Documents/FORMATIONS/CLOUD/DevOps/Terraform/aws_credentials"]
  profile = "Administrator"
}

#Creation du SG
module "sg" {
  source = "../modules/sg"
}

#Creation du volume
module "ebs" {
  source = "../modules/ebs"
  disk_size = 5
}

#Creation de l'EIP
module "eip" {
  source = "../modules/eip"
}

#Creation de l'EC2
module "ec2" {
  source = "../modules/ec2"
  instance_type = "t2.micro"
  public_ip = module.eip.output_eip
  sg_name = module.sg.output_sg_name
}

#Creation des associations necessaires

resource "aws_eip_association" "eip_assoc" {
  instance_id = module.ec2.output_ec2_id
  allocation_id = module.eip.output_eip
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id = module.ebs.output_id_volume
  instance_id = module.ec2.output_ec2_id
}
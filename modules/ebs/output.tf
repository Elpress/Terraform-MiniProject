#Recuperer la valeur de l'ebs pour le raccordement avec l'ec2
output "output_id_volume" {
  value = aws_ebs_volume.myvol1.id
}
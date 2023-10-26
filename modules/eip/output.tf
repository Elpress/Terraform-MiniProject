output "output_eip" {
  value = aws_eip.myeip.public_ip
}

output "output_eip_id" {
  value = aws_eip.myeip.id
}
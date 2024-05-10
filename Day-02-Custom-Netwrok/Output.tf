output "public_ip" {
    value = aws_instance.Pavan_dev.public_ip
    #sensitive = true
  
}
output "private_ip" {
    value = aws_instance.Pavan_dev.private_ip
  
}
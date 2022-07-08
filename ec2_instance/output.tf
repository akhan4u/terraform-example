output "ec2_public_ip" {
  value = aws_instance.ec2.public_ip
}

output "ssh_key" {
  sensitive = true
  value     = tls_private_key.ec2.private_key_openssh
}

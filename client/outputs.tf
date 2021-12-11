output "public_login" {
  value = format("%s%s", "ec2-user@", aws_instance.ec2.public_ip)
}
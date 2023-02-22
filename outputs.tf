output "domain-name" {
  value = aws_instance.ec2_instance.public_dns
}
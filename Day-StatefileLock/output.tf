output "name" {
  description = "print public ip"
  value = aws_instance.name-achhi.public_ip
}
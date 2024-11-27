resource "aws_instance" "Achhi_insta" {
  ami = var.ami_instance_value
  instance_type = var.instance_type_value
  key_name = var.key_name_value
  tags = {
    Name="achhiEC2TFvariables1"
  }
}
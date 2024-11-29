resource "aws_instance" "Achhi_insta" {
  ami = var.ami_instance_value
  instance_type = var.instance_type_value
  key_name = var.key_name_value
  #count = length(var.tagNames)
  for_each = toset(var.tagNames)

  tags = {
    #Name=var.tagNames[count.index]
    Name =each.value
  }
}
resource "aws_instance" "name-achhi" {
    ami=var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    #availability_zone = ""

  tags={
    Name="AchhiTerraformEC2"
  }
}
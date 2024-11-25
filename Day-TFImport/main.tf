resource "aws_instance" "name-achhi" {
    ami="ami-07c9c7aaab42cba5a"
    instance_type = "t2.micro"
    key_name = "Achhi-delete"
    #availability_zone = ""

  tags={
    name="AchhiTerraformEC2"
  }
}
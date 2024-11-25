resource "aws_vpc" "achhi-vpc" {
  cidr_block = "10.0.0.0/16"
  tags={
    Name="achhi-vpc1"
  }
}

#Creation of subnet
resource "aws_subnet" "achhi-subnet" {
  vpc_id = aws_vpc.achhi-vpc.id
  cidr_block = "10.0.0.0/24"
  tags={
    Name="achhi-subnet1"
  }
}

#Internet gateway creation
resource "aws_internet_gateway" "achhi-ig" {
  vpc_id = aws_vpc.achhi-vpc.id
 
  tags={
    Name="achhi-Ig1"
  }
}

#create and edit route table
resource "aws_route_table" "achhi-rt" {
  vpc_id = aws_vpc.achhi-vpc.id
  tags={
    Name="achhi-rt1"
  }
  route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.achhi-ig.id
  }
}

#subnet association to the routhe table
resource "aws_route_table_association" "achhi-association" {
  route_table_id = aws_route_table.achhi-rt.id
  subnet_id = aws_subnet.achhi-subnet.id
}

#create secureity group
resource "aws_security_group" "Achhi-sg" {
  name= "allow all traffic"
   vpc_id = aws_vpc.achhi-vpc.id
   tags={
    Name="achhi-sg1"
  }
  ingress{
    description = "inbound traffic"
    from_port=22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    description = "outbound traffic"
    from_port=0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#create EC2 instance
resource "aws_instance" "name-achhi" {
    ami="ami-07c9c7aaab42cba5a"
    instance_type = "t2.micro"
    key_name = "Achhi-delete"
    #availability_zone = ""

  tags={
    Name="AchhiTerraformEC2"
  }
}
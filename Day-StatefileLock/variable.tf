variable "ami"{
    description = "ami id details"
    type = string
    default = "ami-07c9c7aaab42cba5a"
}
variable "instance_type" {
    description = "instnace type details"
    type = string
    default = "t2.micro"

}
variable "key_name" {
    description = "key pair details"
    type = string
    default = "Achhi-delete"
  
}
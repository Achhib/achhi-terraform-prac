module "achhi"{
    source="../Day-tfvariables"
    ami_instance_value = "ami-0f935a2ecd3a7bd5c"
    instance_type_value = "t2.micro"
    key_name_value = "Achhi-delete"

}
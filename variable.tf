variable "keypair" {
  type = string
  default = "aalimsee-keypair"
}

variable "linux-OS" {
  type = string
  #default = "ami-05576a079321f21f8"
  default = "ami-0df8c184d5f6ae949"
  description = "Amazon Linux 2023 AMI 2023.6.2"
}

variable "subnet-id" {
type = string
  default = "subnet-009c26a2bc10958c3"
  description = "aalimsee-subnet-public1-us-east-1a"
}



# In Terraform, both ${var.name} and var.name are used to reference the value of a variable named "name", but the key difference is that ${var.name} is used for string interpolation, allowing you to embed the variable value directly within a string, while var.name simply accesses the variable value without any string manipulation.

# ami         = var.linuxOS
# description = "${var.linuxOS}-AWS Linux AMI"
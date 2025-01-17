variable "keypair" {
  type = string
  default = "aalimsee-keypair"
}

variable "subnet_id" {
  type = string
  default = "subnet-009c26a2bc10958c3"
  description = "aalimsee-subnet-public1-us-east-1a"
}

variable "linuxOS" {
  type = string
  default = "ami-05576a079321f21f8"
  description = "Amazon Linux 2023 AMI 2023.6.2"
}
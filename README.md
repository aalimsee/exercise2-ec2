# Terraform EC2 Deployment
using variables and output to display instance id and public ip address

In Terraform, both ${var.name} and var.name are used to reference the value of a variable named "name", but the key difference is that ${var.name} is used for string interpolation, allowing you to embed the variable value directly within a string, while var.name simply accesses the variable value without any string manipulation.
data "aws_vpcs" "all_vpcs" {}

#======================================
# Fetch the VPC ID by name
data "aws_vpcs" "filtered_vpcs" {
  filter {
    name   = "tag:Name"
    values = ["*aalimsee*"]
  }
}
output "my_vpc" {
  value = data.aws_vpcs.filtered_vpcs.ids[0] 
}

# Fetch subnets for the filtered VPC
data "aws_subnets" "vpc_subnets" {
  filter {
    name   = "vpc-id"
    # values = data.aws_vpcs.filtered_vpcs.ids
    values = data.aws_vpcs.filtered_vpcs.ids
  }
}
output "aalimsee_subnet_ids" {
  value = data.aws_subnets.vpc_subnets.ids
}
#======================================
# Fetch one public subnet using a filter (e.g., by tag or CIDR block)
data "aws_subnet" "public_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.filtered_vpcs.ids[0]]
  }
  # Optional: Add a tag filter to ensure it's a public subnet
  filter {
    name   = "tag:Name"
    values = ["*public1*"]
  }
}
output "public_subnet" {
  value = data.aws_subnet.public_subnet.id
}
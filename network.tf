//data "aws_vpcs" "all_vpcs" {}

#======================================
# Fetch the VPC ID by name
data "aws_vpcs" "filtered_vpcs" {
  filter {
    name   = "tag:Name"
    values = ["*aalimsee*"]
  }
}
output "output_my_vpcs" {
  value = data.aws_vpcs.filtered_vpcs.ids # 
}

# Fetch subnets for the filtered VPC
#===================================
data "aws_subnets" "filtered_subnets" {
  filter {
    name   = "vpc-id"
    values = data.aws_vpcs.filtered_vpcs.ids
  }
}
output "output_my_subnet_ids" {
  value = data.aws_subnets.filtered_subnets.ids
}

# Fetch public subnets for the filtered VPC
#==========================================
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = data.aws_vpcs.filtered_vpcs.ids
  }
  tags = {
    Name = "*public*"
  }
}
output "output_my_public_subnet_ids" {
  value = data.aws_subnets.public.ids
}
# Fetch one public subnets
output "output_my_public_subnet_id0" {
  value = data.aws_subnets.public.ids[0]
}

# Fetch private subnets for the filtered VPC
#===========================================
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = data.aws_vpcs.filtered_vpcs.ids
  }
  tags = {
    Name = "*private*"
  }
}
output "output_my_private_subnet_ids" {
  value = data.aws_subnets.private.ids
}
# Fetch one public subnets
output "output_my_private_subnet_id0" {
  value = data.aws_subnets.private.ids[0]
}
output "output_my_private_subnet_id1" {
  value = data.aws_subnets.private.ids[1]
}
output "output_my_private_subnet_id3" {
  value = data.aws_subnets.private.ids[2]
}
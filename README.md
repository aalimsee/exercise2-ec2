# Terraform EC2 Deployment
using variables and output to display instance id and public ip address


Outputs:

aalimsee_subnet_ids = tolist([
  "subnet-0f4fc2c58cbf5f94c",
  "subnet-0cefd3a6033d15594",
  "subnet-009c26a2bc10958c3",
  "subnet-07484fa423f35df63",
  "subnet-0a932fdddab245cf9",
  "subnet-05e5e64fa82d6b773",
])
instance_id = "i-0592e8aa27cf743fe"
instance_public_ip = "44.200.35.208"
my_vpc = "vpc-049bea84ae3203889"
public_subnet = "subnet-009c26a2bc10958c3"
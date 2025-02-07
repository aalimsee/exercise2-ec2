
resource "aws_instance" "public" {
  ami                         = var.linux-OS # Amazon Machine Image (AMI)
  instance_type               = "t2.micro"
  key_name                    = "${var.keypair}" # Change to your keyname, e.g. jazeel-key-pair
  subnet_id                   = data.aws_subnets.public.ids[0] # Public Subnet ID, e.g. subnet-xxxxxxxxxxx
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  
  tags = {
    Name = "aalimsee-ce9-tf-ec2"    #Prefix your own name, e.g. jazeel-ec2
    description = "${var.linux-OS}-AWS Linux AMI"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "aalimsee-allow-ssh-exercise2" # Create security group name, e.g. jazeel-terraform-security-group
  description = "Allow SSH inbound"
  vpc_id      = data.aws_vpcs.filtered_vpcs.ids[0]  # VPC ID (Same VPC as your EC2 subnet above), E.g. vpc-xxxxxxx (from AWS Console)
  tags = {
    Name = "aalimsee-allow-ssh-exercise2"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id # Based on above allow_ssh - resource local name
  cidr_ipv4         = "0.0.0.0/0"  
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

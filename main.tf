resource "aws_instance" "public" {
  ami                         = "${var.linuxOS}" # Amazon Machine Image (AMI)
  instance_type               = "t2.micro"
  subnet_id                   = "${var.subnet_id}" # Public Subnet ID, e.g. subnet-xxxxxxxxxxx
  associate_public_ip_address = true
  key_name                    = "${var.keypair}" # Change to your keyname, e.g. jazeel-key-pair
  vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "aalimsee-ce9-tf-ec2"    #Prefix your own name, e.g. jazeel-ec2
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "aalimsee-allow-ssh-exercise2" # Create security group name, e.g. jazeel-terraform-security-group
  description = "Allow SSH inbound"
  vpc_id      = "vpc-049bea84ae3203889"  # VPC ID (Same VPC as your EC2 subnet above), E.g. vpc-xxxxxxx (from AWS Console)
  tags = {
    Name = "aalimsee-allow-ssh-exercise2"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_ssh.id # Based on above allow_ssh - resource local name
  cidr_ipv4         = "0.0.0.0/0"  
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

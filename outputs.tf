output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.public.id # public is the resource name
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.public.public_ip
}
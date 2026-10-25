output "instance_id" {
    description = "The ID of the EC2 instance."
    value = aws_instance.this.id
}

output "instance_public_ip" {
    description = "The public IP address of the EC2 instance."
    value = aws_instance.this.public_ip
}

output "key_name" {
    description = "The name of the key pair used for the instance."
    value = aws_key_pair.this.key_name
}

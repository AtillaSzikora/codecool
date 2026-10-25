# Key pair resource
resource "aws_key_pair" "this" {
    key_name = var.key_name
    public_key = var.public_key
}

# EC2 Instance Resource
resource "aws_instance" "this" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = aws_key_pair.this.key_name

    tags = var.tags
}

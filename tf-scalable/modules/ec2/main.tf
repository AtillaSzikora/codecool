resource "aws_key_pair" "this" {
    key_name = "kalman-key"
    public_key = file(pathexpand("~/.ssh/kalman-ec2.pub"))
    tags = { Name = "Kalman-key-pair" }
}

resource "aws_security_group" "this" {
    name = "allow_SSH"
    vpc_id = var.vpc_id
    tags = { Name = "Kalman-SG" }
}

resource "aws_vpc_security_group_ingress_rule" "this" {
    description = "Allow SSH to (certain) instances only from my IP"
    security_group_id = aws_security_group.this.id
    cidr_ipv4 = "176.63.16.73/32"
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    tags = { Name = "SG-rule-for-SSH" }
}

resource "aws_instance" "this" {
    count = length(local.subnet_list_for_ec2s)

    ami = data.aws_ami.this.id
    instance_type = var.instance_type
    subnet_id = var.subnet_info[local.subnet_list_for_ec2s[count.index]].id
    vpc_security_group_ids = [aws_security_group.this.id]
    key_name = aws_key_pair.this.key_name
    associate_public_ip_address = count.index == 0
    tags = {
        Name = "Kalman-EC2-n${count.index + 1}-on-${local.subnet_list_for_ec2s[count.index]}"
    }
}

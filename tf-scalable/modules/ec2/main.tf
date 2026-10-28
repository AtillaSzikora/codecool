resource "aws_instance" "this" {
    count = length(local.insta_subnet_list)

    ami = data.aws_ami.this.id
    instance_type = var.instance_type
    subnet_id = var.subnet_info[local.insta_subnet_list[count.index]].id

    tags = { Name = "Kalman-EC2-instance" }
}

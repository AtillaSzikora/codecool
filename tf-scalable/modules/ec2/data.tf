data "aws_ami" "this" {
    owners = ["amazon"]
    most_recent = true
    
    filter {
        name = "name"
        values = ["al2023-ami*"]
    }

    filter {
        name = "architecture"
        values = ["x86_64"]
    }
}

resource "aws_vpc" "this" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "vpc-${local.environment}"
        Environment = local.environment
    }
}

resource "aws_subnet" "this" {
    for_each = var.subnets
    
    vpc_id = aws_vpc.this.id
    cidr_block = each.value
    a

    tags = {
        Name = "sebnet-${each.key}"
        
        Tier = each.key
    }
}

output "vpc_id" {
    value = aws_vpc.this.id
}

output "vpc_arn" {
    value = aws_vpc.this.arn
}

output "vpc_tags_all" {
    value = aws_vpc.this.tags_all
}

output "subnet_info" {
    value = {
        for subnet in aws_subnet.this :
        subnet.tags["Name"] => {
            ID   = subnet.id
            CIDR = subnet.cidr_block
            AZ   = subnet.availability_zone
            Tags = subnet.tags_all
        }
    }
}

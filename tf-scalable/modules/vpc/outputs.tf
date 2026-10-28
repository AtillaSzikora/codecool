output "vpc_info" {
    value = {
        ID = aws_vpc.this.id
        Tags = aws_vpc.this.tags_all
    }
}

output "igw_info" {
    value = {
        ID = aws_internet_gateway.this.id
        Owner = aws_internet_gateway.this.owner_id
        Tags = aws_internet_gateway.this.tags_all
    }
}

output "subnet_info" {
    value = {
        for key, subnet in aws_subnet.this : key => {
            az   = subnet.availability_zone
            cidr = subnet.cidr_block
            id   = subnet.id
            tags = subnet.tags_all
        }
    }
}

output "eip_info" {
    value = {
        ID = aws_eip.this.id
        Public-IP = aws_eip.this.public_ip
        Tags = aws_eip.this.tags_all
    }
}

output "nat_gw_info" {
    value = {
        ID = aws_nat_gateway.this.id
        Public-IP = aws_nat_gateway.this.public_ip
        Subnet-ID = aws_nat_gateway.this.subnet_id
        Tags = aws_nat_gateway.this.tags_all
    }
}

output "rt_info" {
    value = {
        for rt in aws_route_table.this :
            rt.tags["Name"] => {
                ID = rt.id
                Tags = rt.tags_all
            }
    }
}

output "rt_assoc_info" {
    value = {
        for rt-assoc in aws_route_table_association.this :
            rt-assoc.subnet_id => rt-assoc.route_table_id
    }
}

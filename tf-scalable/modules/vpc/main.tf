resource "aws_vpc" "this" {
    cidr_block = var.vpc_config.cidr_block
    tags = var.vpc_config.tags
}

resource "aws_internet_gateway" "this" {
    vpc_id = aws_vpc.this.id
    tags = { Name = "Kalman-IGW" }
}

resource "aws_subnet" "this" {
    for_each = var.subnet_map
    
    vpc_id = aws_vpc.this.id
    cidr_block = each.value["cidr"]
    availability_zone = each.value["az"]
    tags = { Name = "Kalman-${each.value["type"]}-${each.key}" }
}

resource "aws_eip" "this" {
    domain = "vpc"
    tags = { Name = "Kalman-EIP-for-NAT-GW" }
}

resource "aws_nat_gateway" "this" {
    allocation_id = aws_eip.this.id
    subnet_id = aws_subnet.this[keys(var.subnet_map)[0]].id
    connectivity_type = "public"
    availability_mode = "zonal"
    depends_on = [ aws_internet_gateway.this ]
    tags = { Name = "Kalman-NAT-GW" }
}

resource "aws_route_table" "this" {
    for_each = var.subnet_map
    
    vpc_id = aws_vpc.this.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = (each.value["type"] == "public"
            ? aws_internet_gateway.this.id
            : null
        )
        nat_gateway_id = (each.value["type"] == "private"
            ? aws_nat_gateway.this.id
            : null
        )
    }
    tags = { Name = "Kalman-RT-${each.key}" }
}

resource "aws_route_table_association" "this" {
    for_each = var.subnet_map
    
    subnet_id = aws_subnet.this[each.key].id
    route_table_id = aws_route_table.this[each.key].id
}

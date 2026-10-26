resource "aws_vpc" "this" {
    cidr_block = local.vpc_config.cidr_block
    tags = local.vpc_config.tags
}

resource "aws_internet_gateway" "this" {
    vpc_id = aws_vpc.this.id
    tags = { Name = "Kalman-IGW" }
}

resource "aws_subnet" "this" {
    vpc_id = aws_vpc.this.id
    count = local.subnet_pairs_count * 2
    cidr_block = "10.0.${count.index + 1}.0/24"
    availability_zone = local.availability_zones[
        count.index % length(local.availability_zones)
    ]
    tags = {
        Name = "Kalman-subnet-${count.index + 1}"
        Type = count.index < local.subnet_pairs_count ? "public" : "private"
    }
}

resource "aws_eip" "this" {
    domain = "vpc"
    tags = { Name = "Kalman-EIP-for-NAT-GW" }
}

resource "aws_nat_gateway" "this" {
    allocation_id = aws_eip.this.id
    subnet_id = aws_subnet.this[0].id
    connectivity_type = "public"
    availability_mode = "zonal"
    depends_on = [ aws_internet_gateway.this ]
    tags = { Name = "Kalman-NAT-GW" }
}

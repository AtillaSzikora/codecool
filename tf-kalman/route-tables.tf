# Resource Route Table
resource "aws_route_table" "kalman_pub_rtb" {
    vpc_id = aws_vpc.kalman_vpc.id
    route {
        cidr_block = var.vpc_cidr
        gateway_id = aws_internet_gateway.kalman_igw.id
    }

    tags = { Name = "kalman-rtb-public-subnets" }
}

# Resource Route Table
resource "aws_route_table" "kalman_prv_rtb" {
    vpc_id = aws_vpc.kalman_vpc.id
    route {
        cidr_block = var.vpc_cidr
        nat_gateway_id = aws_nat_gateway.kalman_nat_gw.id
    }

    tags = { Name = "kalman-rtb-private-subnets" }
}

# Resource Route Table Association for public subnet
resource "aws_route_table_association" "kalman_pub_rtb_assoc" {
    route_table_id = aws_route_table.kalman_pub_rtb.id
    subnet_id = aws_subnet.kalman_pub_subnet1.id
}

# Resource Route Table Association for public subnet
resource "aws_route_table_association" "kalman_pub_rtb_assoc" {
    route_table_id = aws_route_table.kalman_pub_rtb.id
    subnet_id = aws_subnet.kalman_pub_subnet2.id
    }

# Resource Route Table Association for public subnet
resource "aws_route_table_association" "kalman_pub_rtb_assoc" {
    route_table_id = aws_route_table.kalman_pub_rtb.id
    subnet_id = aws_subnet.kalman_pub_subnet3.id
}

# Resource Route Table Association for private subnet
resource "aws_route_table_association" "kalman_prv_rtb_assoc" {
    route_table_id = aws_route_table.kalman_prv_rtb.id
    subnet_id = aws_subnet.kalman_prv_subnet1.id
}

# Resource Route Table Association for private subnet
resource "aws_route_table_association" "kalman_prv_rtb_assoc" {
    route_table_id = aws_route_table.kalman_prv_rtb.id
    subnet_id = aws_subnet.kalman_prv_subnet2.id
}

# Resource Route Table Association for private subnet
resource "aws_route_table_association" "kalman_prv_rtb_assoc" {
    route_table_id = aws_route_table.kalman_prv_rtb.id
    subnet_id = aws_subnet.kalman_prv_subnet3.id
}

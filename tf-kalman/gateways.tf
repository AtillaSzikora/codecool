# Internet Gateway Resource
resource "aws_internet_gateway" "kalman_igw" {
    vpc_id = aws_vpc.kalman_vpc.id

    tags = {
        Name =  "kalman-IGW"
    }
}

# NAT Gateway Resource
resource "aws_nat_gateway" "kalman_nat_gw" {
    subnet_id = aws_subnet.kalman_pub_subnet1.id
    
    tags = {
        Name = "kalman-NAT-GW"
    }
}

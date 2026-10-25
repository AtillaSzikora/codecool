# Subnet Resource
resource "aws_subnet" "kalman_pub_subnet1" {
  vpc_id = aws_vpc.kalman_vpc.id
  cidr_block = var.public_subnet_cidrs[0]
  availability_zone = var.availability_zones[0]

  tags = {
    Name = "public-subnet-eu-c-1a"
  }
}

# Subnet Resource
resource "aws_subnet" "kalman_pub_subnet2" {
  vpc_id = aws_vpc.kalman_vpc.id
  cidr_block = var.public_subnet_cidrs[1]
  availability_zone = var.availability_zones[1]

  tags = {
    Name = "public-subnet-eu-c-1b"
  }
}

# Subnet Resource
resource "aws_subnet" "kalman_pub_subnet3" {
  vpc_id = aws_vpc.kalman_vpc.id
  cidr_block = var.public_subnet_cidrs[2]
  availability_zone = var.availability_zones[2]

  tags = {
    Name = "public-subnet-eu-c-1c"
  }
}

# Subnet Resource
resource "aws_subnet" "kalman_prv_subnet1" {
  vpc_id = aws_vpc.kalman_vpc.id
  cidr_block = var.private_subnet_cidrs[0]
  availability_zone = var.availability_zones[0]

  tags = {
    Name = "private-subnet-eu-c-1a"
  }
}

# Subnet Resource
resource "aws_subnet" "kalman_prv_subnet2" {
  vpc_id = aws_vpc.kalman_vpc.id
  cidr_block = var.private_subnet_cidrs[1]
  availability_zone = var.availability_zones[1]

  tags = {
    Name = "private-subnet-eu-c-1b"
  }
}

# Subnet Resource
resource "aws_subnet" "kalman_prv_subnet3" {
  vpc_id = aws_vpc.kalman_vpc.id
  cidr_block = var.private_subnet_cidrs[2]
  availability_zone = var.availability_zones[2]

  tags = {
    Name = "private-subnet-eu-c-1c"
  }
}

output "vpc_id" {
  description = "The ID of the VPC"
  value = aws_vpc.kalman_vpc.id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value = aws_vpc.kalman_vpc.cidr_block
}

output "vpc_tags" {
  description = "The tags of the VPC"
  value = aws_vpc.kalman_vpc.tags
}

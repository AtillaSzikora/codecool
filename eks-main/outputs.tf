output "vpc_id" {
  description = "ID of the project VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public subnet IDs, in availability-zone order"
  value       = [for az in var.availability_zones : aws_subnet.public[az].id]
}

output "private_subnet_ids" {
  description = "Private subnet IDs, in availability-zone order"
  value       = [for az in var.availability_zones : aws_subnet.private[az].id]
}

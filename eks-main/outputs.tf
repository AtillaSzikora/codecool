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

output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "Kubernetes API endpoint for the EKS cluster"
  value       = aws_eks_cluster.main.endpoint
}

output "update_kubeconfig_command" {
  description = "AWS CLI command to configure kubectl for this cluster"
  value       = "aws eks update-kubeconfig --region ${var.region} --name ${aws_eks_cluster.main.name}"
}

output "service_a_ecr_repository_url" {
  description = "ECR repository URL for Service A"
  value       = aws_ecr_repository.service_a.repository_url
}

output "service_b_ecr_repository_url" {
  description = "ECR repository URL for Service B"
  value       = aws_ecr_repository.service_b.repository_url
}

output "ecr_registry_id" {
  description = "AWS account ID that owns the ECR repositories"
  value       = aws_ecr_repository.service_a.registry_id
}

output "nlb_security_group_id" {
  description = "Security group ID to attach to the public NLB"
  value       = aws_security_group.nlb.id
}

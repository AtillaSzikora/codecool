output "vpc_id" {
    value = aws_vpc.this.id
}

output "vpc_arn" {
    value = aws_vpc.this.arn
}

output "vpc_tags_all" {
    value = aws_vpc.this.tags_all
}

resource "aws_vpc" "this" {
    cidr_block = var.vpc_config.cidr_block
    tags = var.vpc_config.tags
}


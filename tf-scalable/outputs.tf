output "vpc_id" {
    value = module.vpc.vpc_id
}

output "vpc_arn" {
    value = module.vpc.vpc_arn
}

output "vpc_tags_all" {
    value = module.vpc.vpc_tags_all
}

output "subnet_info" {
    value = module.vpc.subnet_info
}

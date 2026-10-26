module "vpc" {
    source = "./modules/vpc"
    region = var.region
    vpc_config = var.vpc_config
    subnet_pairs_count = var.subnet_pairs_count
}

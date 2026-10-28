module "vpc" {
    source = "./modules/vpc"
    vpc_config = var.vpc_config
    subnet_map = var.subnet_map
}

module "ec2" {
    source = "./modules/ec2"
    instance_type = var.instance_type
    subnet_map = var.subnet_map
    subnet_info = module.vpc.subnet_info
}

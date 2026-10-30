module "vpc" {
    source = "./modules/vpc"
    vpc_config = var.vpc_config
    subnet_config = var.subnet_config
}

module "ec2" {
    source = "./modules/ec2"
    instance_type = var.instance_type
    subnet_config = var.subnet_config
    subnet_info = module.vpc.subnet_info
    vpc_id = module.vpc.vpc_info["ID"]
}

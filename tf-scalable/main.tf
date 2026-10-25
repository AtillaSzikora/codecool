module "vpc" {
    source = "./modules/vpc"

    vpc_config = {
        cidr_block = "10.0.0.0/16"
        tags = { Name = "Kalman-main-VPC" }
    }
}

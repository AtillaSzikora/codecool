locals {
    region = "eu-central-1"

    availability_zones = [
        "${local.region}a",
        "${local.region}b",
        "${local.region}c",
    ]

    vpc_config = {
        cidr_block = "10.0.0.0/16"
        tags = { Name = "Kalman-main-VPC" }
    }

    subnet_pairs_count = 3
}

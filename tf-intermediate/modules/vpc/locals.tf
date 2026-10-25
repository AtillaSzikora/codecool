locals {
    environment = "production"
    region = "us-east-1"
    full_name = "${local.environment}-${local-region}"
}

locals {
    subnet_map = {
        for idx, cidr in var.subnets :
        "subnet-${idx}" => cidr
    }
}

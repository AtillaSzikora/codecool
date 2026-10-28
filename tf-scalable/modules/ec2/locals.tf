locals {
    insta_subnet_list = flatten([
        for key, subnet in var.subnet_map :
            [for i in range(subnet["ec2_insta_count"]) : key]
    ])
}

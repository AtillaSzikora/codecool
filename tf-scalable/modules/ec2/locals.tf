# Returns a list of Subnet keys (subnet-1)
# Where subnet keys repeat as many times as ec2_insta_count is set in the base config.
locals {
    subnet_list_for_ec2s = flatten([
        for key, subnet in var.subnet_config :
            [for i in range(subnet["ec2_insta_count"]) : key]
    ])
}

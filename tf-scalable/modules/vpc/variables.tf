variable "vpc_config" {
    description = "VPC Configuration"
    type = object({
        cidr_block = string
        tags = map(string)
    })
}

variable "subnet_config" {
    description = "Subnet Configuration for creating Subnets"
    type = map(object({
        az = string
        cidr = string
        type =  string
        ec2_insta_count = number
    }))
}

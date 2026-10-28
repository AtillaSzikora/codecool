variable "vpc_config" {
    description = "VPC Configuration"
    type = object({
        cidr_block = string
        tags = map(string)
    })
}

variable "subnet_map" {
    description = "Subnet Map"
    type = map(object({
        az = string
        cidr = string
        type =  string
        ec2_insta_count = number
    }))
}

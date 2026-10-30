variable "instance_type" {
    description = "Instance Type"
    type = string
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

variable "subnet_info" {
    description = "Subnet Information with IDs after creation"
    type = map(object({
        az = string
        cidr = string
        id = string
        tags = map(string)
    }))
}

variable "vpc_id" {
    type = string
}

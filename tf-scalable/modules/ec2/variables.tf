variable "instance_type" {
    description = "Instance Type"
    type = string
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

variable "subnet_info" {
    description = "Subnet Configuration"
    type = map(object({
        az = string
        cidr = string
        id = string
        tags = map(string)
    }))
}

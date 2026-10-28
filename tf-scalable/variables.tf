variable "region" {
    description = "AWS Region"
    type = string
}

variable "profile" {
    description = "Profile to work with"
    type = string
}

variable "default_tags" {
    description = "Default Tags for all Resources to add"
    type = map(string)
}

variable "vpc_config" {
    description = "VPC Configuration"
    type = object({
        cidr_block = string
        tags = map(string)
    })
}

variable "instance_type" {
    description = "Instance Type"
    type = string
}

variable "subnet_map" {
    description = "Subnet Map"
    type = map(object({
        az = string
        cidr = string
        type = string
        ec2_insta_count = number
    }))
    validation {
        condition = alltrue([
            for subnet in values(var.subnet_map) :
            contains(["eu-central-1a", "eu-central-1b", "eu-central-1c"], subnet.az)
        ])
        error_message = "Each availability zone must be one of the following: 'eu-central-1a', 'eu-central-1b', 'eu-central-1c'."
    }
    validation {
        condition = alltrue([
            for subnet in values(var.subnet_map) :
            contains(["public", "private"], subnet.type)
        ])
        error_message = "Each subnet type must be either 'public' or 'private'."
    }
    validation {
        condition = alltrue([
            for subnet in values(var.subnet_map) :
            can(cidrhost(subnet.cidr, 0))
        ])
        error_message = "Each subnet cidr must be a valid CIDR block."
    }
    validation {
        condition = alltrue([
            for subnet in values(var.subnet_map) :
            subnet.ec2_insta_count >= 0 && subnet.ec2_insta_count <= 3
        ])
        error_message = "Each subnet ec2_insta_count must be between 0 and 3."
    }
}

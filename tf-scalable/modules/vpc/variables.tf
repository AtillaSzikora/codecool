variable "region" {
    description = "AWS Region"
    type = string
}

variable "vpc_config" {
    description = "VPC Configuration"
    type = object({
        cidr_block = string
        tags = map(string)
    })
}

variable "subnet_pairs_count" {
    description = "Number of public-private Subnet pairs to Create"
    type = number
}

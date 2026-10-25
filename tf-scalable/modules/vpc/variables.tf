variable "vpc_config" {
    description = "Main VPC Configuration"
    type = object({
        cidr_block = string
        tags = map(string)
    })    
}

variable "key_name" {
    description = "The name of the key pair to use for the instance."
    type = string
}

variable "public_key" {
    description = "The public key to use for the key pair."
    type = string
}

variable "ami" {
    description = "The AMI ID to use for the instance."
    type = string
}

variable "instance_type" {
    description = "The instance type to use for the instance."
    type = string
    default = "t2.micro"
}

variable "tags" {
    description = "The tags to apply to the instance."
    type = map(string)
    default = {}
}

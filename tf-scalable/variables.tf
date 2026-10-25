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

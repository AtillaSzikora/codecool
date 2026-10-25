variable "subnets" {
    type = list(string)
    default = {
        web = "10.0.1.0/24"
        app = "10.0.2.0/24"
        db  = "10.0.3.0/24"
    }
}

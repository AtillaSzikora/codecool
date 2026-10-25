module "web_server" {
    source = "./modules/ec2-instance"

    key_name = "my-key-pair"
    public_key = file("~/.ssh/id_rsa.pub")
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t3.medium"

    tags = {
        Name = "web-server"
        Environment = "production"
    }
}

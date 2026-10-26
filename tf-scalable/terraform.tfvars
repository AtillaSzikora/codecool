region = "eu-central-1"

profile = "default"

default_tags = {
    Owner = "Kalman"
    Task = "TF-scalable-infra"
}

vpc_config = {
    cidr_block = "10.0.0.0/16"
    tags = { Name = "Kalman-main-VPC" }
}

subnet_pairs_count = 3

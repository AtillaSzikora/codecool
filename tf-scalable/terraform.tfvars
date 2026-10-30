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

instance_type = "t2.micro"

subnet_config = {
    "subnet-1": {
        az = "eu-central-1a"
        cidr = "10.0.1.0/24"
        ec2_insta_count = 0
        type = "public"
    }
    "subnet-2": {
        az = "eu-central-1b"
        cidr = "10.0.2.0/24"
        ec2_insta_count = 0
        type = "public"
    }
    "subnet-3": {
        az = "eu-central-1c"
        cidr = "10.0.3.0/24"
        ec2_insta_count = 0
        type = "public"
    }
    "subnet-4": {
        az = "eu-central-1a"
        cidr = "10.0.4.0/24"
        ec2_insta_count = 1
        type = "private"
    }
    "subnet-5": {
        az = "eu-central-1b"
        cidr = "10.0.5.0/24"
        ec2_insta_count = 1
        type = "private"
    }
    "subnet-6": {
        az = "eu-central-1c"
        cidr = "10.0.6.0/24"
        ec2_insta_count = 1
        type = "private"
    }
}

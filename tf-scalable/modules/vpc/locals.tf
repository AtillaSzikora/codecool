locals {
    availability_zones = [
        "${var.region}a",
        "${var.region}b",
        "${var.region}c",
    ]

    subnet_type = [
        for i in range(var.subnet_pairs_count * 2) :
            i < var.subnet_pairs_count ? "public" : "private"
    ]
}

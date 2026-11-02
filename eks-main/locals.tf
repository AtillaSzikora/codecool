locals {
  common_tags = merge(var.tags, {
    Project = var.project_name
  })

  public_subnets = {
    for index, az in var.availability_zones : az => var.public_subnet_cidrs[index]
  }

  private_subnets = {
    for index, az in var.availability_zones : az => var.private_subnet_cidrs[index]
  }
}

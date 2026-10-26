output "vpc_info" { value = module.vpc.vpc_info }
output "igw_info" { value = module.vpc.igw_info }
output "subnet_info" { value = module.vpc.subnet_info }
output "eip_info" { value = module.vpc.eip_info }
output "nat_gw_info" { value = module.vpc.nat_gw_info }

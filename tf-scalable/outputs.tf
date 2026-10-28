output "vpc_info" { value = module.vpc.vpc_info }
output "igw_info" { value = module.vpc.igw_info }
output "subnet_info" { value = module.vpc.subnet_info }
output "eip_info" { value = module.vpc.eip_info }
output "nat_gw_info" { value = module.vpc.nat_gw_info }
output "rt-info" { value = module.vpc.rt_info }
output "rt-assoc-info" { value = module.vpc.rt_assoc_info }

output "insta-subnet_list" { value = module.ec2.insta_subnet_list }

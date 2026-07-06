output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "VPC の CIDR ブロック"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "Public subnet の ID 一覧"
  value       = module.public_subnet.subnet_ids
}

output "public_subnet_ids_by_key" {
  description = "Public subnet の ID を key 付きで出力"
  value       = module.public_subnet.subnet_ids_by_key
}

output "private_subnet_ids" {
  description = "Private subnet の ID 一覧"
  value       = module.private_subnet.subnet_ids
}

output "private_subnet_ids_by_key" {
  description = "Private subnet の ID を key 付きで出力"
  value       = module.private_subnet.subnet_ids_by_key
}

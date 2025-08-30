output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.network.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.network.public_subnets
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = module.network.private_subnets
}

output "instance_ids" {
  description = "IDs of EC2 instances"
  value       = module.compute.instance_ids
}

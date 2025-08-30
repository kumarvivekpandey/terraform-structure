# Network Module

This module creates a VPC with public and private subnets, an internet gateway, and routing for public subnets.

## Inputs

- vpc_cidr: CIDR block for the VPC
- public_subnets: List of CIDRs for public subnets
- private_subnets: List of CIDRs for private subnets
- availability_zones: List of AZs to deploy subnets
- env_name: Environment label (e.g., dev, prod)

## Outputs

- vpc_id: ID of the created VPC
- public_subnets: IDs of the public subnets
- private_subnets: IDs of the private subnets

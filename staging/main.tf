terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket         = "company-terraform-state"
    key            = "staging/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "../../modules/network"
  
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "compute" {
  source = "../../modules/compute"

  instance_count = var.instance_count
  instance_type  = var.instance_type
  subnet_ids     = module.network.private_subnets
}

module "security" {
  source = "../../modules/security"

  allowed_ssh_cidr = var.allowed_ssh_cidr
  instance_ids     = module.compute.instance_ids
}

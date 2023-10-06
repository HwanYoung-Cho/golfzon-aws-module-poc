terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.5.0"
    }
  }
}
provider "aws" {
  region = var.region
}
module "compute" {
  source  = "app.terraform.io/hycho-training/compute/aws"
  version = "1.0.0"
  prefix  = var.prefix
  subnet_id = module.network.aws_subnet_id
  security_group = module.security.security_group_id
}
module "network" {
  source  = "app.terraform.io/hycho-training/network/aws"
  version = "1.0.0"
  prefix  = var.prefix
  region  = var.region
}
module "security" {
  source  = "app.terraform.io/hycho-training/security/aws"
  version = "1.0.0"
  prefix  = var.prefix
  vpc_id  = module.network.aws_vpc_id
}

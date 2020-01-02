terraform {
  backend "s3" {
  }
}

provider "aws" {
  version = "~> 2.31.0"
}


module "infrastructure" {
  source = "./modules/v1.0.0"
}

module "backend" {
  source     = "./modules/backend"
  s3_tfstate = var.s3_tfstate
}

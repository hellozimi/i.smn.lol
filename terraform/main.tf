locals {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket = "tf-state-smn"
    key    = "i.smn.lol/terraform"
    region = "eu-west-1"
  }

  required_providers {
    aws = {
      version = "~> 3.37"
    }
  }
}

provider "aws" {
  region = local.region
}

module "image_hosting" {
  source = "./modules/aws-s3-image-static-hosting"

  bucket_name = "i.smn.lol"
}

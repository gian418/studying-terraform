terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }

  backend "s3" {
    bucket = "curso-terraform-gianhaack"
    key    = "aws-vm-provisioners/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      "owner"      = "gianhaack"
      "managed-by" = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "curso-terraform-gianhaack"
    key    = "aws-vpc/terraform.tfstate"
    region = "sa-east-1"
  }
}
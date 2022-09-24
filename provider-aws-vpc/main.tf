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
    key    = "aws-vpc-provider/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = {
      "owner"      = "gianhaack"
      "managed-by" = "terraform"
      "region" = "sa-east-1"
    }
  }
}

provider "aws" {
  alias = "eua"
  region = "us-east-1"

  default_tags {
    tags = {
      "owner"      = "gianhaack"
      "managed-by" = "terraform"
      "region" = "us-east-1"
    }
  }
}
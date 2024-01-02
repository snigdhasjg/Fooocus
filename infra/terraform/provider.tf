terraform {
  required_providers {
    aws = {
      version = "~> 5.31.0"
    }
    tailscale = {
      source  = "tailscale/tailscale"
      version = "~> 0.13.13"
    }
  }
  backend "s3" {
    region  = "ap-south-1"
    acl     = "bucket-owner-full-control"
    bucket  = "terraform-backend-joe-sandbox"
    encrypt = true
    key     = "Fooocus/infra/terraform/terraform.tfstate"
  }
}

provider "aws" {
  default_tags {
    tags = {
      component   = "Fooocus"
      environment = "sandbox"
      owner       = "Snigdhajyoti Ghosh"
    }
  }
}

provider "tailscale" {
  user_agent = "terraform"

  scopes = [
    "devices"
  ]
}

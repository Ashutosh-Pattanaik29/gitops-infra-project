terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "tf-state-gitops-p18-94821"
    key    = "gitops-project18/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "gitops_demo" {
  bucket = "gitops-demo-app-p18-94821"

  tags = {
    Project     = "Project-18-GitOps"
    ManagedBy   = "GitHub-Actions"
    Environment = "Production"
  }
}

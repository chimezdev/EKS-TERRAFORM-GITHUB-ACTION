provider "aws" {
    region = var.aws-region  
}

terraform {
    required_version = "~> 1.8.4"
    required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.49.0"
    }
  }
    backend "s3" {
        bucket = "palm-cicd-artifact"
        key = "eks-github-action/terraform.tfstate"
        dynamodb_table = "palm-terraform-locks"
        kms_key_id     = "arn:aws:kms:eu-west-1:038462750799:key/fbfc32d6-539b-4c81-bf58-d5db169b5322"
        region = "eu-west-1"
    }
}
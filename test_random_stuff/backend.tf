terraform {
  required_version = "~> 1.3.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }

    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "aws" {
  region  = "eu-west-1"
}

provider "docker" {
  host = "public.ecr.aws"
}
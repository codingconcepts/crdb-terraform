terraform {
  cloud {
    organization = "robreid"

    workspaces {
      name = "crdb-terraform"
    }
  }

  required_providers {
    cockroach = {
      source = "cockroachdb/cockroach"
    }
  }
}

resource "cockroach_cluster" "crdb-terraform" {
  cloud_provider = "AWS"
  name           = "dev-crdb-terraform"
  regions        = [
    {
      name = "eu-central-1"
    },
    {
      name = "us-east-1"
    },
    {
      name = "ap-south-1"
    }
  ]
  serverless = {
    spend_limit = 0
  }
}
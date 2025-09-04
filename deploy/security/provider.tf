terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.49.2"
    }
  }

  backend "gcs" {
    bucket = "property-price-engine-tf-state-001"
    prefix = "security/terraform/state"
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

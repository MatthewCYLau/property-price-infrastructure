terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.7.0"
    }
  }

  backend "gcs" {
    bucket = "property-price-engine-tf-state-001"
    prefix = "terraform/state"
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {

  region  = var.region
  zone    = var.zone
  project = var.project

}
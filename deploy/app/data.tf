data "google_project" "this" {
}

data "google_cloud_run_v2_service" "ingest" {
  name     = "property-price-ingest"
  location = var.region
}
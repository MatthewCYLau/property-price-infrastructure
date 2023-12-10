resource "google_storage_bucket" "assets" {
  name          = "property-price-engine-assets"
  location      = "EUROPE-WEST2"
  storage_class = "STANDARD"
  uniform_bucket_level_access = true

  labels = {
    app = var.application_name
  }
}

resource "google_storage_bucket_iam_member" "all_users_view" {
  bucket = google_storage_bucket.assets.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}
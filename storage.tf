resource "google_storage_bucket" "assets" {
  name          = "property-price-engine-assets"
  location      = "EUROPE-WEST2"
  storage_class = "STANDARD"
}

data "google_iam_policy" "this" {
  binding {
    role = "roles/storage.objectViewer"
    members = [
      "allUsers",
    ]
  }

  binding {
    role = "roles/storage.legacyBucketReader"
    members = [
      "serviceAccount:620656388728-compute@developer.gserviceaccount.com"
    ]
  }

  binding {
    role = "roles/storage.legacyBucketWriter"
    members = [
      "serviceAccount:620656388728-compute@developer.gserviceaccount.com"
    ]
  }
}

resource "google_storage_bucket_iam_policy" "this" {
  bucket      = google_storage_bucket.assets.name
  policy_data = data.google_iam_policy.this.policy_data
}
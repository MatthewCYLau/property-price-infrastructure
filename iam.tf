resource "google_service_account" "api" {
  account_id   = "${var.application_name}-api-001"
  display_name = "Service Account for ${var.application_name} API Cloud Run service"
}

resource "google_project_iam_member" "api_object_create" {
  project = var.project
  role    = "roles/storage.objectCreator"
  member  = "serviceAccount:${google_service_account.api.email}"
  condition {
    title       = "resource_name_starts_with_assets_bucket"
    description = "Resource name starts with assets storage bucket"
    expression  = "resource.name.startsWith(\"projects/_/buckets/${google_storage_bucket.assets.name}/objects/\")"
  }
}

resource "google_project_iam_member" "api_pubsub_publish" {
  project = var.project
  role    = "roles/pubsub.publisher"
  member  = "serviceAccount:${google_service_account.api.email}"
}

resource "google_service_account" "ingest" {
  account_id   = "${var.application_name}-ingest"
  display_name = "Service Account for ${var.application_name} Cloud Run ingest service"
}

resource "google_project_iam_member" "ingest_pubsub_subscribe" {
  project = var.project
  role    = "roles/pubsub.subscriber"
  member  = "serviceAccount:${google_service_account.ingest.email}"
}

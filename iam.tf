resource "google_service_account" "api" {
  account_id   = "${var.application_name}-api-001"
  display_name = "Service Account for ${var.application_name} API Cloud Run service"
}

resource "google_project_iam_member" "api_object_create" {
  project = var.project
  role    = "roles/storage.objectCreator"
  member  = "serviceAccount:${google_service_account.api.email}"
}
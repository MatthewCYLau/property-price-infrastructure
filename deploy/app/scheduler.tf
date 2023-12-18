resource "google_cloud_scheduler_job" "ingest" {
  name             = "${var.application_name}-scheduled-ingest"
  description      = "${var.application_name} scheduled ingest"
  schedule         = "*/5 * * * *"
  attempt_deadline = "320s"
  region           = var.region
  project          = var.project

  retry_config {
    retry_count = 3
  }

  http_target {
    http_method = "GET"
    uri         = data.google_cloud_run_v2_service.ingest.uri

    oidc_token {
      service_account_email = google_service_account.ingest_invoker.email
    }
  }
}
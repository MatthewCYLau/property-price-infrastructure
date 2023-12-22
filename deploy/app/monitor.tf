resource "google_logging_metric" "ingest_job_complete" {
  name   = "${var.application_name}/injest-job-complete"
  filter = <<EOT
resource.type = "cloud_run_revision"
resource.labels.service_name = "property-price-ingest"
resource.labels.location = "${var.region}"
textPayload: "Update job complete"
EOT
  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
  }
}


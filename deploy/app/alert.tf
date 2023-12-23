resource "google_monitoring_notification_channel" "email" {
  display_name = "${var.application_name} Notification Channel"
  type         = "email"
  labels = {
    email_address = "lau.cy.matthew@gmail.com"
  }
  force_delete = true
}

resource "google_monitoring_alert_policy" "alert_policy" {
  display_name = "${var.application_name} ingest job threshold"
  combiner     = "OR"
  conditions {
    display_name = "Ingest job count greater than threshold"
    condition_threshold {
      filter     = "resource.type = \"cloud_run_revision\" AND metric.type = \"logging.googleapis.com/user/${google_logging_metric.ingest_job_complete.id}\""
      duration   = "0s"
      comparison = "COMPARISON_GT"
      aggregations {
        alignment_period     = "60s"
        per_series_aligner   = "ALIGN_COUNT"
        cross_series_reducer = "REDUCE_COUNT"
      }
      threshold_value = 5
      trigger {
        count = 1
      }
    }
  }
  notification_channels = [google_monitoring_notification_channel.email.id]
}
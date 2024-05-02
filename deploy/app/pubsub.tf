resource "google_pubsub_topic" "jobs" {
  name = "ingest-jobs-topic"
  schema_settings {
    schema   = "projects/${var.project}/schemas/${google_pubsub_schema.job.name}"
    encoding = "JSON"
  }
  labels = local.labels
}

resource "google_pubsub_subscription" "jobs" {
  name                       = "ingest-jobs-subscription"
  topic                      = google_pubsub_topic.jobs.name
  ack_deadline_seconds       = 30
  message_retention_duration = "86400s" # one day
  retain_acked_messages      = true
  labels                     = local.labels
}

resource "google_pubsub_schema" "job" {
  name = "ingest-job"
  type = "AVRO"
  definition = jsonencode({
    "type" : "record",
    "name" : "Avro",
    "fields" : [
      {
        "name" : "PostCode",
        "type" : "string",
        "default" : ""
      },
      {
        "name" : "JobId",
        "type" : "string",
        "default" : ""
      }
    ]
    }
  )
}
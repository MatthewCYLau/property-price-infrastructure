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

resource "google_monitoring_dashboard" "dashboard" {
  dashboard_json = <<EOF
{
  "category": "CUSTOM",
  "displayName": "Property Price Engine",
  "mosaicLayout": {
    "columns": 12,
    "tiles": [
      {
        "height": 4,
        "widget": {
          "title": "Transactions ",
          "xyChart": {
            "chartOptions": {
              "mode": "COLOR"
            },
            "dataSets": [
              {
                "timeSeriesQuery": {
                  "timeSeriesFilter": {
                    "filter": "metric.type=\"logging.googleapis.com/user/${google_logging_metric.ingest_job_complete.name}\" resource.type=\"cloud_run_revision\"",
                    "aggregation": {
                      "perSeriesAligner": "ALIGN_RATE",
                      "crossSeriesReducer": "REDUCE_SUM",
                      "groupByFields": []
                    }
                  }
                },
                "plotType": "LINE",
                "minAlignmentPeriod": "60s",
                "targetAxis": "Y1",
                "legendTemplate": ""
              }
            ],
            "timeshiftDuration": "0s",
            "yAxis": {
              "label": "y1Axis",
              "scale": "LINEAR"
            }
          }
        },
        "width": 6,
        "xPos": 0,
        "yPos": 0
      }
    ]
  }
}
EOF
}


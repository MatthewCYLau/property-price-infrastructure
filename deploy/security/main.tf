resource "google_service_account" "wif" {
  display_name = "${var.application_name}-wif-sa"
  description  = "Property Price Engine Workload Identity Federation service account"
  project      = var.project
  account_id   = "${var.application_name}-wif-sa"
}

resource "google_project_iam_member" "project" {
  project = var.project
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.wif.email}"
}

resource "random_integer" "pool" {
  min = 1
  max = 50000
}

module "gh_oidc" {
  source      = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  project_id  = var.project
  pool_id     = "${var.application_name}-pool-${random_integer.pool.id}"
  provider_id = "${var.application_name}-provider"
  sa_mapping = {
    "wif-sa" = {
      sa_name   = google_service_account.wif.name
      attribute = "attribute.repository/MatthewCYLau/property-price-infrastructure"
    }
  }
}

output "gh_oidc" {
  value = module.gh_oidc
}

run "storage_buck_test" {
  command = plan

  variables {
    expected_name = "property-price-engine-assets"
  }

  assert {
    condition     = google_storage_bucket.assets.name == var.expected_name
    error_message = "Test failed: the attribute value was not as expected."
  }

}
# 1. Create the Service Account for the API Gateway
resource "google_service_account" "api_gateway_invoker_sa" {
  provider     = google-beta
  project      = var.project_id
  account_id   = var.api_gateway_sa_account_id
  display_name = "API Gateway Invoker SA"
}

resource "google_api_gateway_api" "api" {
  provider     = google-beta
  api_id       = local.api_id
  display_name = local.api_display_name
  labels       = var.labels
  project      = var.project_id
}

resource "google_api_gateway_api_config" "api_config" {
  provider      = google-beta
  api           = google_api_gateway_api.api.api_id
  api_config_id = local.api_config_id
  openapi_documents {
    document {
      path     = var.openapi_document_name
      contents = var.openapi_spec
    }
  }
  gateway_config {
    backend_config {
      google_service_account = google_service_account.api_gateway_invoker_sa.email
    }
  }
  lifecycle {
    create_before_destroy = true
  }
  labels  = var.labels
  project = var.project_id
}

resource "google_api_gateway_gateway" "gateway" {
  provider     = google-beta
  gateway_id   = local.gateway_id
  display_name = local.api_display_name
  api_config   = google_api_gateway_api_config.api_config.id
  region       = var.region
  labels       = var.labels
  project      = var.project_id
}
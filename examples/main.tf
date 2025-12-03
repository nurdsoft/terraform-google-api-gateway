variable "environment" {
  description = "environment"
  type        = string
  default     = "dev"
}

variable "project_id" {
  description = "Project ID"
  type        = string
  default     = "test-459520"
}

variable "api_id" {
  description = "The unique identifier for the API Gateway API."
  type        = string
  default     = "nurdsoft-test-api"
}

variable "gateway_id" {
  description = "The unique identifier for the Gateway instance."
  type        = string
  default     = "nurdsoft-test-gateway"
}

variable "region" {
  description = "The region where the API Gateway will be deployed."
  type        = string
  default     = "us-central1"
}

variable "api_display_name" {
  description = "Display name for the API Gateway and associated components."
  type        = string
  default     = "Nurdsoft test API Gateway"
}

variable "labels" {
  description = "Labels."
  type        = map(string)
  default = {
    customer                   = "nurdsoft"
    goog-terraform-provisioned = "true"
    owner                      = "devops-nurdsoft-co"
  }
}

variable "openapi_spec_path" {
  description = "Path to the OpenAPI specification file in YAML format. This will be loaded and embedded directly in the API Config."
  type        = string
  default     = "openapi.yaml"
}

variable "openapi_document_name" {
  description = "openapi document name used in the API Config."
  type        = string
  default     = "openapi.yaml"
}

locals {
  openapi_spec = templatefile("${path.module}/${var.openapi_spec_path}", {})
}

module "api_gateway" {
  source                = "nurdsoft/api-gateway/google"
  version               = "~> 1.0"
  
  project_id            = var.project_id
  region                = var.region
  environment           = var.environment
  api_id                = var.api_id
  gateway_id            = var.gateway_id
  api_display_name      = var.api_display_name
  openapi_spec          = base64encode(local.openapi_spec)
  openapi_document_name = var.openapi_document_name
  labels                = var.labels
}
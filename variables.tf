variable "environment" {
  description = "environment"
  type        = string
}

variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "api_id" {
  description = "The unique identifier for the API Gateway API."
  type        = string
}

variable "gateway_id" {
  description = "The unique identifier for the Gateway instance."
  type        = string
}

variable "region" {
  description = "The region where the API Gateway will be deployed."
  type        = string
}

variable "api_display_name" {
  description = "Display name for the API Gateway and associated components."
  type        = string
}

variable "labels" {
  default     = {}
  description = "Labels."
  type        = map(string)
}

variable "openapi_spec" {
  description = "Base64 OpenAPI specification encoded format. This will be loaded and embedded directly in the API Config."
  type        = string
}

variable "openapi_document_name" {
  description = "openapi document name used in the API Config."
  type        = string
}

variable "api_gateway_sa_account_id" {
  description = "The account_id for the new Service Account to be created for API Gateway backend auth."
  type        = string
  default     = "api-gateway-invoker-sa"
}
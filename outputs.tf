output "gateway_url" {
  value = google_api_gateway_gateway.gateway.default_hostname
}

output "service_account_email" {
  description = "The email of the service account created for API Gateway backend auth."
  value       = google_service_account.api_gateway_invoker_sa.email
}

output "service_account_member" {
  description = "The IAM member identifier (with 'serviceAccount:' prefix) for the service account."
  value       = google_service_account.api_gateway_invoker_sa.member
}
output "gateway_url" {
  description = "The URL of the deployed API Gateway"
  value       = module.api_gateway.gateway_url
}

output "service_account_email" {
  description = "The email of the service account created for API Gateway backend auth"
  value       = module.api_gateway.service_account_email
}

output "service_account_member" {
  description = "The IAM member identifier for the service account"
  value       = module.api_gateway.service_account_member
}
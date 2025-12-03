# terraform-google-api-gateway

This module provisions a Google Cloud API Gateway using an OpenAPI specification.

## Usage

```hcl
module "api_gateway" {
  source               = "nurdsoft/api-gateway/google"
  version              = "~> 1.0"
  
  project_id           = var.project_id
  region               = var.region
  environment          = var.environment
  api_id               = "my-api"
  gateway_id           = "my-gateway"
  api_display_name     = "My API Gateway"
  openapi_spec         = base64encode(file("${path.module}/files/openapi.yaml"))
  labels = {
    env = var.environment
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.0 |
| <a name="requirement_google-beta"></a> [google-beta](#requirement\_google-beta) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google-beta"></a> [google-beta](#provider\_google-beta) | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [google-beta_google_api_gateway_api.api](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_api_gateway_api) | resource |
| [google-beta_google_api_gateway_api_config.api_config](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_api_gateway_api_config) | resource |
| [google-beta_google_api_gateway_gateway.gateway](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_api_gateway_gateway) | resource |
| [google-beta_google_service_account.api_gateway_invoker_sa](https://registry.terraform.io/providers/hashicorp/google-beta/latest/docs/resources/google_service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_display_name"></a> [api\_display\_name](#input\_api\_display\_name) | Display name for the API Gateway and associated components. | `string` | n/a | yes |
| <a name="input_api_gateway_sa_account_id"></a> [api\_gateway\_sa\_account\_id](#input\_api\_gateway\_sa\_account\_id) | The account\_id for the new Service Account to be created for API Gateway backend auth. | `string` | `"api-gateway-invoker-sa"` | no |
| <a name="input_api_id"></a> [api\_id](#input\_api\_id) | The unique identifier for the API Gateway API. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | environment | `string` | n/a | yes |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | The unique identifier for the Gateway instance. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels. | `map(string)` | `{}` | no |
| <a name="input_openapi_document_name"></a> [openapi\_document\_name](#input\_openapi\_document\_name) | openapi document name used in the API Config. | `string` | n/a | yes |
| <a name="input_openapi_spec"></a> [openapi\_spec](#input\_openapi\_spec) | Base64 OpenAPI specification encoded format. This will be loaded and embedded directly in the API Config. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | Project ID | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The region where the API Gateway will be deployed. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gateway_url"></a> [gateway\_url](#output\_gateway\_url) | n/a |
| <a name="output_service_account_email"></a> [service\_account\_email](#output\_service\_account\_email) | The email of the service account created for API Gateway backend auth. |
| <a name="output_service_account_member"></a> [service\_account\_member](#output\_service\_account\_member) | The IAM member identifier (with 'serviceAccount:' prefix) for the service account. |

## Authors

Module is maintained by [Nurdsoft](https://github.com/nurdsoft).

---

## License

Apache 2 Licensed. See [LICENSE](https://github.com/nurdsoft/terraform-google-api-gateway/tree/main/LICENSE) for full details.
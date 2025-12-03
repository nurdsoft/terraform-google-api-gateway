# Google API Gateway Example

This example demonstrates how to use the `terraform-google-api-gateway` module to deploy a Google Cloud API Gateway with a sample OpenAPI specification.

## What This Example Creates

- Google API Gateway API
- API Gateway Configuration with OpenAPI spec
- API Gateway instance
- Service Account for backend authentication

## Prerequisites

- Google Cloud Project with API Gateway API enabled
- Terraform >= 1.3.0
- Appropriate IAM permissions to create API Gateway resources

## Usage

1. Clone this repository or copy the example files
2. Update the variables in `main.tf` or create a `terraform.tfvars` file:

```hcl
project_id       = "your-gcp-project-id"
environment      = "dev"
api_id           = "my-test-api"
gateway_id       = "my-test-gateway"
api_display_name = "My Test API Gateway"
region           = "us-central1"
```

3. Initialize and apply:

```bash
terraform init
terraform plan
terraform apply
```

## Files

- `main.tf` - Main configuration with module usage
- `versions.tf` - Provider version constraints
- `outputs.tf` - Output values from the module
- `openapi.yaml` - Sample OpenAPI specification
- `README.md` - This documentation

## Sample OpenAPI Spec

The included `openapi.yaml` contains a simple API with a single `/hello` endpoint that returns a greeting. You can replace this with your own OpenAPI specification.

## Outputs

After applying, you'll get:

- `gateway_url` - The URL where your API Gateway is accessible
- `service_account_email` - Email of the created service account
- `service_account_member` - IAM member identifier for the service account

## Clean Up

To destroy the resources:

```bash
terraform destroy
```

## Customization

You can customize this example by:

- Modifying the OpenAPI specification in `openapi.yaml`
- Adjusting the labels and naming conventions
- Changing the region or other configuration parameters
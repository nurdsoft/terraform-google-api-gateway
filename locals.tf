locals {
  spec_hash        = substr(md5(var.openapi_spec), 0, 8) 
  api_config_id    = "cfg-${var.environment}-${local.spec_hash}"
  api_id           = "${var.api_id}-${var.environment}"
  api_display_name = "${var.api_display_name}-${var.environment}"
  gateway_id       = "${var.gateway_id}-${var.environment}"
}
output "enabled_apis" {
  description = "Enabled APIs in the project"
  value       = [for api in google_project_service.gcp_service_api : api.service]
}

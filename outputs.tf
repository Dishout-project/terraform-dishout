output "dishout_frontend_ip" {
  description = "dishout_frontend server IP"
  value       = module.dishout_frontend.static_ip
}

output "dishout_backend_ip" {
  description = "dishout_backend IP"
  value       = module.dishout_backend.static_ip
}

output "mongo_ip" {
  description = "mongo_db IP"
  value       = module.mongodb_compute.static_ip
}
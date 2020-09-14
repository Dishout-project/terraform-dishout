output "webapp-ip" {
  description = "Dishout web server IP"
  value       = module.compute.static_ip
}

output "backend-ip" {
  description = "dishout_backend IP"
  value       = module.dishout-backend.static_ip
}

output "mongo-ip" {
  description = "Mongodb IP"
  value       = module.mongodb-compute.static_ip
}
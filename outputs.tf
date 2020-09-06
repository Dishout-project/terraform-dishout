output "webapp-ip" {
  description = "Dishout web server IP"
  value       = module.compute.static_ip
}

output "mongo-ip" {
  description = "Mongodb IP"
  value       = module.mongodb-compute.static_ip
}
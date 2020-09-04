output "webapp-ip" {
  value = module.compute.static_ip
  }

output "mongo-ip" {
  value = module.mongodb-compute.static_ip
  }

module "network" {
  source = "./modules/network"
  name = var.network_name
}

module "compute" {
  source = "./modules/compute"
  network_name = module.network.name
  static_ip_name = var.static_ip_name
  firewall_name = var.compute_firewall_name
  firewall_tcp_ports = var.compute_tcp_ports
  name = var.compute_name
  machine_type = var.machine_type
  image = var.image
  script_path = var.script_path
  # static_ip_name = var.static_ip_name
}

module "mongodb-compute" {
  source = "./modules/compute"
  network_name = module.network.name
  static_ip_name = var.mongo_static_ip_name
  firewall_name = var.mongo_firewall_name
  firewall_tcp_ports = var.mongo_tcp_ports
  name = var.mongo_compute_name
  machine_type = var.machine_type
  image = var.image
  script_path= var.mongo_script_path
  # static_ip_name = var.static_ip_name
}

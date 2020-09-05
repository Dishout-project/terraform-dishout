
module "network" {
  source = "./modules/network"
  name   = var.network_name
}

module "compute" {
  source         = "./modules/compute"
  network_name   = module.network.name
  compute_tag  = var.compute_tag
  static_ip_name = var.static_ip_name
  ssh_user = var.ssh_user
  ssh_pub_key = var.ssh_pub_key
  ssh_private_key = var.ssh_private_key
  duckdns_token = var.duckdns_token
  name           = var.compute_name
  machine_type   = var.machine_type
  image          = var.image
  script_path    = var.script_path
  ansible_playbook = var.ansible_playbook
  ansible_inventory = var.ansible_inventory
  firewall_name = var.firewall_name
  firewall_rules = var.firewall_rules
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
}
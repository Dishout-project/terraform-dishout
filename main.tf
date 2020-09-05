
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
}


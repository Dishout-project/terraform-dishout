
module "network" {
  source = "./modules/network"
  name   = var.network_name
}

module "compute" {
  source            = "./modules/compute"
  network_name      = module.network.name
  name              = var.web_compute.name
  compute_tag       = var.web_compute.tag
  machine_type      = var.web_compute.machine_type
  image             = var.web_compute.image
  script_path       = var.web_compute.script_path
  firewall_name     = var.web_compute.firewall.name
  firewall_rules    = var.web_compute.firewall.rules
  static_ip_name    = var.web_compute.static_ip_name
  ssh_user          = var.ssh.user
  ssh_pub_key       = var.ssh.public_key
  ssh_private_key   = var.ssh.private_key
  ansible_playbook  = var.ansible_provisioner.playbook
  ansible_inventory = var.ansible_provisioner.inventory
  duckdns_token     = var.duckdns_token

}

module "mongodb-compute" {
  source              = "./modules/compute"
  network_name      = module.network.name
  name              = var.mognodb_compute.name
  compute_tag       = var.mognodb_compute.tag
  machine_type      = var.mognodb_compute.machine_type
  image             = var.mognodb_compute.image
  script_path       = var.mognodb_compute.script_path
  firewall_name     = var.mognodb_compute.firewall.name
  firewall_rules    = var.mognodb_compute.firewall.rules
  static_ip_name    = var.mognodb_compute.static_ip_name
  ssh_user          = var.ssh.user
  ssh_pub_key       = var.ssh.public_key
  ssh_private_key   = var.ssh.private_key
  ansible_playbook  = ""
  ansible_inventory = ""
  duckdns_token     = ""
}

module "network" {
  source = "./modules/network"
  name   = var.network_name
}

module "compute" {
  source           = "./modules/compute"
  network_name     = module.network.name
  name             = var.web_compute.name
  compute_tag      = var.web_compute.tag
  machine_type     = var.web_compute.machine_type
  image            = var.web_compute.image
  script_path      = var.web_compute.script_path
  firewall_name    = var.web_compute.firewall.name
  firewall_rules   = var.web_compute.firewall.rules
  static_ip_name   = var.web_compute.static_ip_name
  ssh_user         = var.ssh.user
  ssh_pub_key      = var.ssh.public_key
  ssh_private_key  = var.ssh.private_key
  ansible_playbook = var.ansible_playbook
  install_duckdns  = var.web_compute.install_duckdns
  duckdns_token    = var.duckdns_token
}

module "dishout-backend" {
  source           = "./modules/compute"
  network_name     = module.network.name
  name             = var.dishout_backend.name
  compute_tag      = var.dishout_backend.tag
  machine_type     = var.dishout_backend.machine_type
  image            = var.dishout_backend.image
  script_path      = var.dishout_backend.script_path
  firewall_name    = var.dishout_backend.firewall.name
  firewall_rules   = var.dishout_backend.firewall.rules
  static_ip_name   = var.dishout_backend.static_ip_name
  ssh_user         = var.ssh.user
  ssh_pub_key      = var.ssh.public_key
  ssh_private_key  = var.ssh.private_key
  ansible_playbook = var.ansible_playbook
  install_duckdns  = var.dishout_backend.install_duckdns
  duckdns_token    = var.duckdns_token
}

module "mongodb-compute" {
  source           = "./modules/compute"
  network_name     = module.network.name
  name             = var.mognodb_compute.name
  compute_tag      = var.mognodb_compute.tag
  machine_type     = var.mognodb_compute.machine_type
  image            = var.mognodb_compute.image
  script_path      = var.mognodb_compute.script_path
  firewall_name    = var.mognodb_compute.firewall.name
  firewall_rules   = var.mognodb_compute.firewall.rules
  static_ip_name   = var.mognodb_compute.static_ip_name
  ssh_user         = var.ssh.user
  ssh_pub_key      = var.ssh.public_key
  ssh_private_key  = var.ssh.private_key
  ansible_playbook = var.ansible_playbook
  install_duckdns  = var.mognodb_compute.install_duckdns
  duckdns_token    = null
}
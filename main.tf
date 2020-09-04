
module "network" {
  source = "./modules/network"
  name   = var.network_name
}

module "compute" {
  source         = "./modules/compute"
  network_name   = module.network.name
  compute_tag  = var.compute_tag
  static_ip_name = var.static_ip_name
  ssh_pub_key = var.ssh_pub_key
  name           = var.compute_name
  machine_type   = var.machine_type
  image          = var.image
  script_path    = var.script_path
  firewall_name = var.firewall_name
}

module "network" {
  source = "./modules/network"
  name   = var.network_name
}

module "compute" {
  source         = "./modules/compute"
  network_name   = module.network.name
  static_ip_name = var.static_ip_name
  name           = var.compute_name
  machine_type   = var.machine_type
  image          = var.image
  script_path    = var.script_path
  # static_ip_name = var.static_ip_name
}
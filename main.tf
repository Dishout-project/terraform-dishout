
module "network" {
  source = "./modules/network"
  name = var.name
}

module "compute" {
  source = "./modules/compute"
  network_name = module.network.name
  name = var.compute_name
  machine_type = var.machine_type
  image = var.image
}
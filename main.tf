
module "network" {
  source = "./modules/network"
  name = var.network_name
}

module "compute" {
  source = "./modules/compute"
  network_name = module.network.name
  static_ip_name = var.static_ip_name
  name = var.compute_name
  machine_type = var.machine_type
  image = var.image
  script_path = var.script_path
  # static_ip_name = var.static_ip_name
}

module "mongodb-compute" {
  source = "./modules/mongodb-compute"
  network_name = module.network.name
  mongo_static_ip_name = var.mongo_static_ip_name
  name = var.mongo_compute_name
  machine_type = var.machine_type
  image = var.image
  mongo_script_path= var.mongo_script_path
  # static_ip_name = var.static_ip_name
}



# Create a Project
# resource "mongodbatlas_project" "atlas-project" {
#   org_id = var.atlas_org_id
#   name = var.atlas_project_name
# }

# # Create a Database User
# resource "mongodbatlas_database_user" "db-user" {
#   username = var.mongodb_username
#   password = var.mongodb_password
#   project_id = mongodbatlas_project.atlas-project.id
#   auth_database_name = "admin"
#   roles {
#     role_name     = var.mongodb_rolename
#     database_name = format("%s-db", var.atlas_project_name)
#   }
# }

# # Whitelist External IPs
# resource "mongodbatlas_project_ip_whitelist" "atlas-whitelist" {
#   project_id = mongodbatlas_project.atlas-project.id
#   cidr_block = format("%s/32", module.compute.static_ip)
#   comment    = "CIDR block for main office"
# }



# # Creating the cluster
# resource "mongodbatlas_cluster" "atlas-cluster" {
#   project_id = mongodbatlas_project.atlas-project.id
#   name = format("%s-%s-cluster",var.atlas_project_name,var.environment )
#   num_shards = 1
#   replication_factor = 3
#   provider_backup_enabled = true
#   auto_scaling_disk_gb_enabled = true
#   mongo_db_major_version = "4.2"
  
#   provider_name = "GCP"
#   disk_size_gb = 40
#   provider_instance_size_name = var.cluster_instance_size_name
#   provider_region_name = var.atlas_region
# }
# Create a Project
resource "mongodbatlas_project" "atlas-project" {
  org_id = var.atlas_org_id
  name = var.atlas_project_name
}

# Create a Database User
resource "mongodbatlas_database_user" "db-user" {
  username = var.mongodb_username
  password = var.mongodb_password
  project_id = mongodbatlas_project.atlas-project.id
  auth_database_name = "admin"
  roles {
    role_name     = var.mongodb_rolename
    database_name = format("%s-db", var.atlas_project_name)
  }
}

# Whitelist External IPs
resource "mongodbatlas_project_ip_whitelist" "atlas-whitelist" {
  project_id = mongodbatlas_project.atlas-project.id
  cidr_block = format("%s/32", module.compute.static_ip)
  comment    = "CIDR block for main office"
}

# Creating the cluster
resource "mongodbatlas_cluster" "atlas-cluster" {
  project_id = mongodbatlas_project.atlas-project.id
  name = format("%s-%s-cluster",var.atlas_project_name,var.environment )
  num_shards = 1
  replication_factor = 3
  provider_backup_enabled = true
  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version = "4.2"
  
  provider_name = "GCP"
  disk_size_gb = 40
  provider_instance_size_name = var.cluster_instance_size_name
  provider_region_name = var.atlas_region
}
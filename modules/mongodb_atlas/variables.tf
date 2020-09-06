
# MongoDB Atlas

variable "atlas_public_key" {}

variable "atlas_private_key" {}

variable "atlas_org_id"{}

variable "atlas_project_name"{}

variable "mongodb_username"{}

variable "mongodb_password"{}

variable "mongodb_rolename"{
}
variable "environment"{}

# Cluster instance size name 
variable "cluster_instance_size_name" {}
# Atlas region
variable "atlas_region" {}


# # MongoDB Atlas 
# variable "atlas_public_key" {
#   type        = string
#   description = "Your MongoDD_Atlas plublic API access token"
# }

# variable "atlas_private_key" {
#   type        = string
#   description = "Your MongoDD_Atlas private API access token"
# }

# variable "atlas_org_id" {
#   type        = string
#   description = "Atlas organization id"

# }

# variable "atlas_project_name" {
#   type        = string
#   description = "Atlas project name"
#   default     = "dishout"
# }

#  variable "mongodb_username" {
#   type        = string
#   description = "Mongodb db username"
#   default     = "terraform"
# }

# variable "mongodb_password" {
#   type        = string
#   description = "Atlas project db password"
# }

# variable "mongodb_rolename" {
#   type        = string
#   description = "Role Name"
#   default     = "dbAdmin"

# }
# variable "environment" {
#   type        = string
#   description = "??"
#   default     = "environment"
# }

# variable "mongo_tcp_ports" {
#   type    = list(string)
#   default = ["27017", "22"]
# }


# variable "cluster_instance_size_name" {
#   # Cluster instance size name 
#   type        = string
#   description = "Cluster instance size name"
#   default     = "M10"
# }
# variable "atlas_region" {
#   # Atlas region
#   type        = string
#   description = "GCP region where resources will be created"
#   default     = "WESTERN_EUROPE"
# }
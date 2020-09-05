# Network vars
variable "network_name" {
  type    = string
  default = "terraform-network"
}

# Compute vars
variable "compute_name" {
  type    = string
  default = "terraform-instance"
}

variable "compute_tag" {
  type    = string
  default = "dishout"
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}

variable "image" {
  type    = string
  default = "ubuntu-1804-bionic-v20200807"
}

variable "ssh_user" {
  type    = string
  default = "dishout"
}

variable "ssh_pub_key" {
  type    = string
  default = "credential/dishout-ssh-keys.pub"
}

variable "ssh_private_key" {
  type    = string
  default = "credential/dishout-ssh-keys"
}

variable "duckdns_token" {
  type    = string
  description = "DuckDns token"
}


variable "script_path" {
  type    = string
  default = "files/startup.sh"
}

variable "ansible_playbook" {
  type    = string
  default = "provisioner/playbook.yml"
}

variable "ansible_inventory" {
  type    = string
  default = "provisioner/inventory.compute.gcp.yml"
}

variable "static_ip_name" {
  type    = string
  default = "terraform-static-ip"
}

variable "compute_firewall_name" {
  type    = string
  default = "compute-firewall"
}

# Mongo
variable "firewall_name" {
  type    = string
  default = "test-firewall"
}

variable "firewall_rules" {
  type = map(any)

  default = {
    "tcp" = "80,443,22,3000,"
    "icmp" = ""
  }
}

# MongoDB Atlas 
variable "atlas_public_key" {
  type        = string
  description = "Your MongoDD_Atlas plublic API access token"
}

variable "atlas_private_key" {
  type        = string
  description = "Your MongoDD_Atlas private API access token"
}

variable "atlas_org_id" {
  type        = string
  description = "Atlas organization id"

}

variable "atlas_project_name" {
  type        = string
  description = "Atlas project name"
  default     = "dishout"

variable "mongo_compute_name" {
  type    = string
  default = "mongodb"
}

variable "mongo_static_ip_name" {
  type    = string
  default = "mongo-terraform-static-ip"
}

variable "mongo_script_path" {
  type    = string
  default = "files/mongo.sh"
}

variable "mongo_firewall_name" {
  type    = string
  default = "mongo-firewall"
}

 variable "mongodb_username" {
  type        = string
  description = "Mongodb db username"
  default     = "terraform"
}

variable "mongodb_password" {
  type        = string
  description = "Atlas project db password"
}

variable "mongodb_rolename" {
  type        = string
  description = "Role Name"
  default     = "dbAdmin"

}
variable "environment" {
  type        = string
  description = "??"
  default     = "environment"

variable "mongo_tcp_ports" {
  type    = list(string)
  default = ["27017", "22"]
}


variable "cluster_instance_size_name" {
  # Cluster instance size name 
  type        = string
  description = "Cluster instance size name"
  default     = "M10"
}
variable "atlas_region" {
  # Atlas region
  type        = string
  description = "GCP region where resources will be created"
  default     = "WESTERN_EUROPE"
}

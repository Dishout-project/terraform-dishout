# compute vars
variable "name" {}
variable "machine_type" {}
variable "image" {}
variable "network_name"{}
variable "script_path"{}
variable "compute_tag"{}
variable "ssh_user"{}
variable "ssh_pub_key"{}
variable "ssh_private_key"{}
variable "duckdns_token"{}

variable "ansible_playbook"{}
variable "ansible_inventory"{}

# static_ip vars
variable "static_ip_name"{}


# firewall vars
variable "firewall_name"{}

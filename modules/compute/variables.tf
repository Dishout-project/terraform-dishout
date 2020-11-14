# compute vars
variable "name" {}
# variable "subnet_name" {}
variable "machine_type" {}
variable "image" {}
variable "network_name"{}
variable "script_path"{}

variable "compute_tags"{}
variable "ssh_user"{}
variable "ssh_pub_key"{}
variable "ssh_private_key"{}

# duckdns
variable "install_duckdns"{}
variable "duckdns_token"{}
variable "duckdns_subdomain"{}

# ansible
variable "ansible_playbook"{}

# static_ip vars
variable "static_ip_name"{}

# firewall vars
variable "firewall_name"{}

variable "firewall_rules"{}

# envs
variable "envs"{}
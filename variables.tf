variable "network_name" {
  type    = string
  default = "terraform-network"
}

variable "compute_name" {
  type    = string
  default = "terraform-instance"
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}

variable "image" {
  type    = string
  default = "ubuntu-1804-bionic-v20200807"
}

variable "script_path" {
  type    = string
  default = "files/startup.sh"
}


variable "static_ip_name" {
  type    = string
  default = "terraform-static-ip"
}

variable "compute_firewall_name" {
  type    = string
  default = "compute-firewall"
}

variable "compute_tcp_ports" {
  type    = list(string)
  default = ["80", "443", "3000", "22"]
}

# TODO: Look into getting below code to work in module
# variable "compute_ports" {
#   type = list(object({
#     protocol = string
#     ports = list(string)
#   }))
#   default = [
#     {
#       protocol = "tcp"
#       ports = ["80", "443", "3000", "22"]
#     }
#   ]
# }

# Mongo

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

variable "mongo_tcp_ports" {
  type    = list(string)
  default = ["27017", "22"]
}

# variable "mongo_ports" {
#   type = list(object({
#     protocol = string
#     ports = list(string)
#   }))
#   default = [
#     {
#       protocol = "tcp"
#       ports = ["27017", "22"]
#     }
#   ]
# }

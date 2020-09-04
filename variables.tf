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


# variable "docker_ports" {
#   type = list(object({
#     protocol = string
#     ports = list(string)
#   }))
#   default = [
#     {
#       protocol = "tcp"
#       ports = ["80", "443", "3000", "22"]
#     },
#     {
#       protocol = "icmp"
#       ports = [""]
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
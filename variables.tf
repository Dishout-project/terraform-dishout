variable "name" {
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

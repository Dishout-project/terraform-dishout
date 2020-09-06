# Network vars
variable "network_name" {
  type    = string
  default = "terraform-network"
}

variable "web_compute" {
  type = object({
    name           = string
    tag            = list(string)
    machine_type   = string
    image          = string
    script_path    = string
    static_ip_name = string

    firewall = object({
      name = string
      rules = map(object({
        ports         = list(string)
        source_ranges = list(string)
      }))
    })

    install_duckdns = bool
  })

  default = {
    name           = "web"
    tag            = ["web"]
    machine_type   = "e2-micro"
    image          = "ubuntu-1804-bionic-v20200807"
    script_path    = "files/startup.sh"
    static_ip_name = "web-terraform-static-ip"

    firewall = {
      name = "web-firewall"
      rules = {
        "tcp" = {
          ports         = ["80", "443", "22"]
          source_ranges = ["0.0.0.0/0"]
        }
        "icmp" = {
          ports         = null
          source_ranges = ["0.0.0.0/0"]
        }
      }
    }
    install_duckdns = true
  }
}

variable "mognodb_compute" {
  type = object({
    name           = string
    tag            = list(string)
    machine_type   = string
    image          = string
    script_path    = string
    static_ip_name = string

    firewall = object({
      name = string
      rules = map(object({
        ports         = list(string)
        source_ranges = list(string)
      }))
    })

    install_duckdns = bool

  })

  default = {
    name           = "mongodb"
    tag            = ["mongodb"]
    machine_type   = "e2-micro"
    image          = "ubuntu-1804-bionic-v20200807"
    script_path    = "files/mongo.sh"
    static_ip_name = "mongo-terraform-static-ip"

    firewall = {
      name = "mongo-firewall"
      rules = {
        "tcp" = {
          ports         = ["27017", "22"]
          source_ranges = ["0.0.0.0/0"]
        }
        "icmp" = {
          ports         = null
          source_ranges = ["0.0.0.0/0"]
        }
      }
    }
    install_duckdns = false
  }
}

variable "ssh" {
  type = object({
    user        = string
    public_key  = string
    private_key = string

  })
  default = {
    "user"        = "dishout"
    "public_key"  = "credential/dishout-ssh-keys.pub"
    "private_key" = "credential/dishout-ssh-keys"
  }
}

variable "ansible_playbook" {
  type    = string
  default = "playbook.yml"
}


variable "duckdns_token" {
  type        = string
  description = "DuckDns token, currently using Fortune's account tokken"
}

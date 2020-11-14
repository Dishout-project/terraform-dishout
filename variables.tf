# Network vars
variable "network_name" {
  type    = string
  default = "dishout-terraform-network"
}

variable "dishout_frontend" {
  type = object({
    name           = string
    tags           = list(string)
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

    labels = map(string)

    envs = object({
      DOCKER_IMAGE      = string
      DOCKER_PORT       = string
      CONTAINER_NAME    = string
      DUCKDNS_SUBDOMAIN = string
    })
  })

  default = {
    name           = "dishout-frontend"
    tags           = ["dishout-frontend"]
    machine_type   = "e2-micro"
    image          = "ubuntu-1804-bionic-v20200807"
    script_path    = "files/dishout-frontend.sh"
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

    labels = {
      env          = "prod",
      dns_strategy = "duckdns",
      tier         = "frontend"
    }

    envs = {
      DOCKER_IMAGE      = "fortunexfortune/dishout-frontend"
      DOCKER_PORT       = "80:80"
      CONTAINER_NAME    = "dishout-frontend"
      DUCKDNS_SUBDOMAIN = "dishout-frontend"
    }
  }
}

variable "dishout_backend" {
  type = object({
    name           = string
    tags           = list(string)
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

    labels = map(string)

    envs = object({
      DOCKER_IMAGE      = string
      DOCKER_PORT       = string
      CONTAINER_NAME    = string
      DUCKDNS_SUBDOMAIN = string
    })
  })

  default = {
    name           = "dishout-backend"
    tags           = ["dishout-backend"]
    machine_type   = "e2-micro"
    image          = "ubuntu-1804-bionic-v20200807"
    script_path    = "files/dishout-backend.sh"
    static_ip_name = "dishout-backend-static-ip"

    firewall = {
      name = "dishout-backend-firewall"
      rules = {
        "tcp" = {
          ports         = ["5000", "443", "22"]
          source_ranges = ["0.0.0.0/0"]
        }
        "icmp" = {
          ports         = null
          source_ranges = ["0.0.0.0/0"]
        }
      }
    }

    labels = {
      env          = "prod",
      dns_strategy = "duckdns",
      tier         = "backend"
    }

    envs = {
      DOCKER_IMAGE      = "fortunexfortune/dishout-backend"
      DOCKER_PORT       = "5000:5000"
      CONTAINER_NAME    = "dishout-backend"
      DUCKDNS_SUBDOMAIN = "dishout-backend"
    }
  }
}


variable "mognodb_compute" {
  type = object({
    name           = string
    tags           = list(string)
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

    labels = map(string)

    envs = object({
      DOCKER_IMAGE      = string
      DOCKER_PORT       = string
      CONTAINER_NAME    = string
      DUCKDNS_SUBDOMAIN = string
    })
  })

  default = {
    name           = "mongodb"
    tags           = ["mongodb"]
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

    labels = {
      env          = "prod",
      dns_strategy = "duckdns"
      tier         = "database"
    }

    envs = {
      DOCKER_IMAGE      = "mongo"
      DOCKER_PORT       = "27017:27017"
      CONTAINER_NAME    = "mongo"
      DUCKDNS_SUBDOMAIN = "dishout-db"
    }
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

variable "duckdns_token" {
  type        = string
  description = "DuckDns token, currently using Fortune's account tokken"
}

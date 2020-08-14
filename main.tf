resource "google_compute_network" "vpc_network" {
  name = "terraform-network"
}

resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
  metadata_startup_script = file("startup.sh")

  tags = ["dishout"]


  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20200807"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }
}
resource "google_compute_address" "static_ip" {
  name = "terraform-static-ip"
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "3000", "22"]
  }

  source_tags = ["dishout"]
  source_ranges = ["0.0.0.0/0"]
}

terraform {
  backend "gcs" {
    bucket      = "dishout-terraform-state"
    prefix      = "dishout/state"
    credentials = "credential/dishout-285810-a65687753e29.json"
  }
}

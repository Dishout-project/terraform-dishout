resource "google_compute_instance" "vm_instance" {
  name         = var.name
  machine_type = var.machine_type
  metadata_startup_script = file(var.mongo_script_path)

  tags = ["dishout"]


  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network_name
    access_config {
      nat_ip = google_compute_address.static_ip.address
    }
  }
}
resource "google_compute_address" "static_ip" {
  name = var.mongo_static_ip_name
}

resource "google_compute_firewall" "default" {
  name    = "mongo-firewall"
  network = var.network_name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["27017", "22"]
  }


  source_tags = ["dishout"]
  source_ranges = ["0.0.0.0/0"]
}
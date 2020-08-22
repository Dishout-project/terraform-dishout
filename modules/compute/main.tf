resource "google_compute_instance" "vm_instance" {
  name         = var.name
  machine_type = var.machine_type
  metadata_startup_script = file(var.script_path)

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
  name = var.static_ip_name
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = var.network_name

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
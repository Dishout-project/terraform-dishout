resource "google_compute_instance" "vm_instance" {
  name         = var.name
  machine_type = var.machine_type
  metadata_startup_script = file(var.script_path)

  tags = [var.compute_tag]

  metadata = {
    ssh-keys= format("%s:%s", var.ssh_user, file(var.ssh_pub_key))
  }


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
  name    = var.firewall_name
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
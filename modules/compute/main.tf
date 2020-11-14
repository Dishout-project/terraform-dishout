resource "google_compute_instance" "vm_instance" {
  name                    = var.name
  machine_type            = var.machine_type
  metadata_startup_script = file(var.script_path)
  # zone         = "europe-west2"

  tags = var.compute_tags

  metadata = {
    ssh-keys = format("%s:%s", var.ssh_user, file(var.ssh_pub_key))
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
resource "null_resource" "provioners" {

  depends_on = [
    google_compute_instance.vm_instance
  ]

  provisioner "remote-exec" {
    inline = [
              "echo DUCKDNS_SUBDOMAIN=${var.duckdns_subdomain} | sudo tee -a /etc/environment >/dev/null ",
              "echo DUCKDNS_TOKEN=${var.duckdns_token} | sudo tee -a /etc/environment >/dev/null ",
              "echo DOCKER_IMAGE=${var.envs.DOCKER_IMAGE} | sudo tee -a /etc/environment >/dev/null",
              "echo DOCKER_PORT=${var.envs.DOCKER_PORT} | sudo tee -a /etc/environment >/dev/null",
              "echo CONTAINER_NAME=${var.envs.CONTAINER_NAME} | sudo tee -a /etc/environment >/dev/null"
            ]

    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.ssh_private_key)
      host        = google_compute_address.static_ip.address
    }
  }
}

resource "google_compute_address" "static_ip" {
  name = var.static_ip_name
}

resource "google_compute_firewall" "default" {

  for_each = var.firewall_rules

  name    = "${var.firewall_name}-${each.key}"
  network = var.network_name

  allow {
    protocol = each.key
    ports    = each.value.ports
  }

  source_tags   = var.compute_tags
  source_ranges = each.value.source_ranges
}


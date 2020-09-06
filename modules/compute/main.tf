resource "google_compute_instance" "vm_instance" {
  name                    = var.name
  machine_type            = var.machine_type
  metadata_startup_script = file(var.script_path)
  # zone         = "europe-west2"

  tags = var.compute_tag

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
  # Conditional, allows me to conditionally run the ansible provisioner on the compute instance that meet the requirements.
  count = var.install_duckdns  ? 1 : 0

  provisioner "remote-exec" {
    inline = ["echo ${var.name} compute instance is ready!!"]

    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.ssh_private_key)
      host        = google_compute_address.static_ip.address
    }
  }

  provisioner "local-exec" {
    command     = "ansible-playbook ${var.ansible_playbook} --private-key ../${var.ssh_private_key} --extra-vars 'variable_host=${google_compute_address.static_ip.address} duckdns_token=${var.duckdns_token}'"
    working_dir = "provisioner"
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

  source_tags   = var.compute_tag
  source_ranges = each.value.source_ranges
}


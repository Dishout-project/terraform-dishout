resource "google_compute_instance" "vm_instance" {
  name                    = var.name
  machine_type            = var.machine_type
  metadata_startup_script = file(var.script_path)
  # zone         = "europe-west2"

  tags = [var.compute_tag]

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

  provisioner "remote-exec" {
    inline = ["echo Ready!!"]

    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.ssh_private_key) 
      host = google_compute_address.static_ip.address
    }
  }

  provisioner "local-exec" {
    command = format("ansible-playbook %s -i %s --private-key %s --extra-vars 'ansible_user=%s duckdns_token=%s'", var.ansible_playbook, var.ansible_inventory, var.ssh_private_key, var.ssh_user, var.duckdns_token)
  environment = {
      "ANSIBLE_HOST_KEY_CHECKING" = "False"
    }
  }

}
resource "google_compute_address" "static_ip" {
  name = var.static_ip_name
}

resource "google_compute_firewall" "default" {

 for_each = var.firewall_rules

  name    = var.firewall_name
  network = var.network_name

  allow {
    protocol = each.key
    ports    = split(",", each.value)
  }

  source_tags   = ["dishout"]
  source_ranges = ["0.0.0.0/0"]
}


provider "google" {
  region      = "${var.region}"
  project     = "${var.project_name}"
  credentials = "${file(var.account_file_path)}"
}

resource "google_compute_instance" "vm" {
  count        = 2
  name         = "tf-vm-${count.index}"
  machine_type = "f1-micro"
  zone         = "${var.region_zone}"

  tags = ["http"]

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.front-subnet.self_link}"

    access_config {
      # Ephemeral
    }
  }

  service_account {
    scopes = ["https://www.googleapis.com/auth/compute.readonly"]
  }

  connection {
    user        = "${var.user}"
    private_key = "${file(var.key_path)}"
  }

  metadata {
    startup-script = "${file("./files/provision.sh")}"
  }

  #provisioner "remote-exec" {
  #  script = "files/provision-apache.sh"
  #}
}
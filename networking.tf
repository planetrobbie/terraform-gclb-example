resource "google_compute_network" "front-net" {
  name                    = "front-net"
  auto_create_subnetworks = "false"
  description             = "A frontent network to host deployed compute resources"
}

resource "google_compute_subnetwork" "front-subnet" {
  name          = "front-subnet"
  ip_cidr_range = "10.0.0.0/24"
  network       = "${google_compute_network.front-net.self_link}"
  region        = "${var.region}"
}

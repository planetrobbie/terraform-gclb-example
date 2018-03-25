resource "google_compute_firewall" "allow-front-ingress" {
  name    = "allow-front-ingress"
  network = "${google_compute_network.front-net.self_link}"

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  target_tags = ["http"]
}

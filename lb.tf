resource "google_compute_forwarding_rule" "front-forwarding-rule" {
  name       = "front-forwarding-rule"
  target     = "${google_compute_target_pool.default.self_link}"
  port_range = "80"
}

resource "google_compute_target_pool" "default" {
  name = "instance-pool"

  instances = ["${google_compute_instance.vm.*.self_link}"]

  health_checks = ["${google_compute_http_health_check.default.name}"]
}

resource "google_compute_http_health_check" "default" {
  name               = "default"
  request_path       = "/"
  check_interval_sec = 1
  timeout_sec        = 1
}

output "GCLB IP Address" {
  description = "You can reach your App at"
  value       = "${google_compute_forwarding_rule.front-forwarding-rule.ip_addr}"
}

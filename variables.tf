variable "region" {
  default = "europe-west1"
}

variable "region_zone" {
  default = "europe-west1-c"
}

variable "project_name" {
  description = "sebbraun-yet"
}

variable "account_file_path" {
  description = "~/.config/gcloud/terraform-admin-yet.json"
}

variable "image" {
  description = "Google Compute Image to use"
}

variable "user" {
  description = "user to use to remote connect to VMs"
  default     = "sebbraun"
}

# Generated using: [encrypted key not supported]
# ssh-keygen -t rsa -f ~/.ssh/google.key
variable "key_path" {
  description = "Private Key to access VMs"
  default     = "~/.ssh/google.key"
}

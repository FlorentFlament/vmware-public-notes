variable "nsx_host"     { type = string }
variable "nsx_username" { type = string }
variable "nsx_password" { type = string }
variable "nsx_skip_ssl" { type = bool }

provider "nsxt" {
  host                 = var.nsx_host
  username             = var.nsx_username
  password             = var.nsx_password
  allow_unverified_ssl = var.nsx_skip_ssl
}

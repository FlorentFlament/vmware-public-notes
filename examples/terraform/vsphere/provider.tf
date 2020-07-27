variable vsphere_server   { type = string }
variable vsphere_user     { type = string }
variable vsphere_password { type = string }
variable vsphere_skip_ssl { type = bool }

provider "vsphere" {
  vsphere_server       = var.vsphere_server
  user                 = var.vsphere_user
  password             = var.vsphere_password
  allow_unverified_ssl = var.vsphere_skip_ssl
}

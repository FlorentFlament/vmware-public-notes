variable vsphere_datacenter_name    { type = string }
variable vsphere_datastore_name     { type = string }
variable vsphere_resource_pool_name { type = string }
variable vsphere_folder_name        { type = string }

variable jumpbox_uuid         { type = string }
variable jumpbox_esx_name     { type = string }
variable jumpbox_network_name { type = string }
variable jumpbox_password     { type = string }
variable jumpbox_public_keys  { type = string }
variable jumpbox_user_data    { type = string }

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter_name
}
data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore_name
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_host" "jumpbox_esx" {
  name          = var.jumpbox_esx_name
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_network" "jumpbox_network" {
  name          = var.jumpbox_network_name
  datacenter_id = data.vsphere_datacenter.dc.id
}

// TODO: replace with a resource created by terraform as well
data "vsphere_resource_pool" "pool" {
  name          = "tanzu"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vmFromRemoteOvf" {
  name             = "jumpbox"
  datacenter_id    = data.vsphere_datacenter.dc.id
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  host_system_id   = data.vsphere_host.jumpbox_esx.id
  // TODO have this folder created by terraform
  folder           = var.vsphere_folder_name

  num_cpus = 2

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  ovf_deploy {
    remote_ovf_url = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.ova"
    ovf_network_map = {
      // Beware ! "VM Network" is the name of the network connected to the VM, as described in the ovf file.
      // We can choose to which network we connect the VM by mapping this network.
      "VM Network" = data.vsphere_network.jumpbox_network.id
    }
  }

  // A CDROM client is required to deliver the vapp properties
  cdrom { client_device = true }
  vapp {
    properties = {
      "hostname"    = "jumpbox"
      "instance-id" = var.jumpbox_uuid
      "public-keys" = var.jumpbox_public_keys
      "password"    = var.jumpbox_password
      "user-data"   = base64encode(var.jumpbox_user_data)
    }
  }
}

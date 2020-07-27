data "vsphere_datacenter" "dc" {
  name = "VSPHERE_DATACENTER_NAME"
}
data "vsphere_datastore" "datastore" {
  name          = "VSPHERE_DATASTORE_NAME"
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_resource_pool" "pool" {
  name          = "VSPHERE_RESOURCE_POOL_NAME"
  datacenter_id = data.vsphere_datacenter.dc.id
}
// The host to deploy the VM on is required when deploying from an OVF/OVA template
data "vsphere_host" "host" {
  name          = "VSPHERE_HOST_NAME"
  datacenter_id = data.vsphere_datacenter.dc.id
}
data "vsphere_network" "network" {
  name          = "VSPHERE_NETWORK_NAME"
  datacenter_id = data.vsphere_datacenter.dc.id
}

// Hack to set a static IP from:
// https://communities.vmware.com/message/2872244#2872244
variable "user_data" {
  type = string
  default = <<EOF
#cloud-config
write_files:
- path: /etc/netplan/50-cloud-init.yaml
  content: |
    network:
      version: 2
      ethernets:
        ens192:
          addresses: [VM_IP_ADDRESS/24]
          gateway4: VM_GATEWAY_IP
runcmd:
- netplan apply
EOF
}

resource "vsphere_virtual_machine" "vmFromRemoteOvf" {
  name             = "testvm"
  datacenter_id    = data.vsphere_datacenter.dc.id
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  host_system_id   = data.vsphere_host.host.id
  folder           = "/vm/VSPHERE_VM_FOLDER"

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout  = 0

  ovf_deploy {
    remote_ovf_url = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.ova"
    ovf_network_map = {
      // Beware ! "VM Network" is the name of the network connected to the VM, as described in the ovf file.
      // We can choose to which network we connect the VM by mapping this network.
      "VM Network" = data.vsphere_network.network.id
    }
  }

  // A CDROM client is required to deliver the vapp properties
  cdrom { client_device = true }
  vapp {
    properties = {
      "instance-id" = uuid()
      "hostname"    = "testvm"
      "public-keys" = "SSH_PUBLIC_KEY"
      "password"    = "UBUNTU_USER_PASSWORD"
      "user-data"   = base64encode(var.user_data)
    }
  }
}

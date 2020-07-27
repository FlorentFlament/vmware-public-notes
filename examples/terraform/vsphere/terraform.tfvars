vsphere_server   =
vsphere_user     =
vsphere_password =
vsphere_skip_ssl =

vsphere_datacenter_name    =
vsphere_datastore_name     =
// Deploying everything into the "tanzu" resource pool and folder
vsphere_resource_pool_name = "tanzu"
vsphere_folder_name        = "tanzu"

jumpbox_network_name = "concourse"
jumpbox_uuid         = "PASTE_GENERATED_UUID_HERE"
jumpbox_esx_name     =
jumpbox_password     =
jumpbox_public_keys  =

// Hack to set a static IP from:
// https://communities.vmware.com/message/2872244#2872244
jumpbox_user_data = <<EOF
#cloud-config
write_files:
- path: /etc/netplan/50-cloud-init.yaml
  content: |
    network:
      version: 2
      ethernets:
        ens192:
          addresses: [10.0.0.5/24]
          gateway4: 10.0.0.1
runcmd:
- netplan apply
EOF

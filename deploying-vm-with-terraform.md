# Deploying a VM with Terraform

Because it can be useful to deploy a test VM in order to perform some
troubleshooting, here's a quick way to deploy a vanilla Ubuntu VM into
a network of our choice using [Terraform][1].

[This terraform file][2] provides an example to deploy a VM in any
network. One needs to update the file with environment specific values
(`VSPHERE_NETWORK_NAME`, `VM_IP_ADDRESS`, ...). [A hack][3] is used to
setup a static IP address on this specific OVA image.

Note that we also need to [configure our provider][4] like this (for
instance in a `provider.tf` file):

    provider "vsphere" {
      user           = var.vsphere_user
      password       = var.vsphere_password
      vsphere_server = var.vsphere_server
      # If you have a self-signed cert
      allow_unverified_ssl = true
    }


[1]: https://www.terraform.io/docs/providers/vsphere/r/virtual_machine.html
[2]: examples/vsphere/terraform/testvm.tf
[3]: https://communities.vmware.com/message/2872244#2872244
[4]: https://www.terraform.io/docs/providers/vsphere/index.html

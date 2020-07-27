variable "concourse_cidr" { type = string }
variable "infra_cidr"     { type = string }
variable "tas_cidr"       { type = string }
variable "services_cidr"  { type = string }

data "nsxt_policy_tier0_gateway" "t0" {
  display_name = "Pacific-T0-Gateway"
}
data "nsxt_policy_transport_zone" "overlay" {
  display_name = "TZ-Overlay"
}

resource "nsxt_policy_tier1_gateway" "tanzu" {
  display_name              = "tanzu"
  tier0_path                = data.nsxt_policy_tier0_gateway.t0.path
}
resource "nsxt_policy_segment" "concourse" {
    display_name        = "concourse"
    connectivity_path   = nsxt_policy_tier1_gateway.tanzu.path
    transport_zone_path = data.nsxt_policy_transport_zone.overlay.path
    subnet {
      cidr = var.concourse_cidr
    }
}
resource "nsxt_policy_segment" "infra" {
    display_name        = "infra"
    connectivity_path   = nsxt_policy_tier1_gateway.tanzu.path
    transport_zone_path = data.nsxt_policy_transport_zone.overlay.path
    subnet {
      cidr = var.infra_cidr
    }
}
resource "nsxt_policy_segment" "tas" {
    display_name        = "tas"
    connectivity_path   = nsxt_policy_tier1_gateway.tanzu.path
    transport_zone_path = data.nsxt_policy_transport_zone.overlay.path
    subnet {
      cidr = var.tas_cidr
    }
}
resource "nsxt_policy_segment" "services" {
    display_name        = "services"
    connectivity_path   = nsxt_policy_tier1_gateway.tanzu.path
    transport_zone_path = data.nsxt_policy_transport_zone.overlay.path
    subnet {
      cidr = var.services_cidr
    }
}

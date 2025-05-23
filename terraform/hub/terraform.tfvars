nodes = {
  "10.0.5.101" = {
    name             = "k0smotron-controlplane-1"
  }
  "10.0.5.102" = {
    name             = "k0smotron-controlplane-2"
  }
  "10.0.5.103" = {
    name             = "k0smotron-controlplane-3"
  }
}

ip_base             = "10.0.5.0"
cidr                = 9
gateway             = "10.0.0.1"

proxmox_image   = "local:iso/Talos-1.8.1-proxmox-qemu.iso"
proxmox_storage = "local-zfs"

cluster_name = "cplane-cluster"

gitops_addons_org = "https://github.com/jamesatintegratnio"
gitops_addons_repo = "gitops-homelab"
gitops_addons_basepath = "gitops/"
gitops_addons_path = "bootstrap/control-plane/addons"
gitops_addons_revision = "main"

cloudflare_zone_name = "integratn.tech"

cloudflare_records = {
  "controlplane" = {
    name    = "cp.integratn.tech"
    content   = "10.0.5.200"
    type    = "A"
    ttl     = 1
    proxied = false
  }
  "star.controlplane" = {
    name    = "*.cp.integratn.tech"
    content   = "10.0.5.200"
    type    = "A"
    ttl     = 1
    proxied = false
  }
}
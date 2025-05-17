
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
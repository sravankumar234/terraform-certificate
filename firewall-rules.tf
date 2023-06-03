module "network_firewall-rules" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  version      = "7.0.0"
  project_id   = var.project
  network_name = module.network_vpc.network_name

  rules = [

    {
      name        = "public-rule"
      direction   = "INGRESS"
      priority    = 100
      ranges      = ["0.0.0.0/0"]
      target_tags = ["public-server"]
      allow = [{
        protocol = "all"
      }]
      deny = []
      log_config = {
        metadata = "EXCLUDE_ALL_METADATA"
      }
    },
    {
      name        = "private-rule"
      direction   = "INGRESS"
      priority    = 100
      ranges      = ["10.0.1.0/24"]
      target_tags = ["private-server"]
      allow = [{
        protocol = "tcp"
        ports    = ["22"]
      }]
      deny = []
      log_config = {
        metadata = "EXCLUDE_ALL_METADATA"
      }

    }
  ]
}

# }

# module "firewall_rules" {
#   source       = "terraform-google-modules/network/google//modules/firewall-rules"
#   project_id   = var.project_id
#   network_name = module.network_vpc.network_name

#   rules = [{
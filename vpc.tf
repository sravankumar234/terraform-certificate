

module "network_vpc" {
  source                  = "terraform-google-modules/network/google//modules/vpc"
  version                 = "7.0.0"
  network_name            = "main-vpc"
  project_id              = var.project
  auto_create_subnetworks = false
}






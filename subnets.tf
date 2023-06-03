module "public-subnet" {
  source       = "terraform-google-modules/network/google//modules/subnets"
  version      = "7.0.0"
  project_id   = var.project
  network_name = module.network_vpc.network_name
  subnets = [
    {
      subnet_name   = "public-subnet"
      subnet_ip     = "10.0.1.0/24"
      subnet_region = var.location
    }
  ]
}

module "private-subnet" {
  source       = "terraform-google-modules/network/google//modules/subnets"
  version      = "7.0.0"
  project_id   = var.project
  network_name = module.network_vpc.network_name
  subnets = [
    {
      subnet_name           = "private-subnet"
      subnet_ip             = "10.0.2.0/24"
      subnet_region         = var.location
      subnet_private_access = "true"
    }
  ]
}



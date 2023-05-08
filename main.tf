module "bucket" {
  source  = "terraform-google-modules/cloud-storage/google//modules/simple_bucket"
  version = "~> 4.0"

  name       = var.name
  project_id = var.project-id
  location   = var.location
}

module "network_vpc" {
  source  = "terraform-google-modules/network/google//modules/vpc"
  version = "7.0.0"
  # insert the 2 required variables here
  network_name = "${var.name}-vpc"
  project_id   = var.project-id
}

# output "Bucket" {
#   value = module.bucket
# }
output "Bucket-name" {
  value = module.bucket.name
}
                          
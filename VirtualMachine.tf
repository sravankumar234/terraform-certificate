# data "google_service_account" "retrieve_service_account" {
#   project = var.project
#   filter {
#     name   = "name"
#     values = ["*@developer.gserviceaccount.com"]
#   }    
# }

# resource "google_service_account" "service_account" {
#   account_id   = data.google_service_account.retrieve_service_account.id
#   display_name = "Service Account for compute engines"
# }

data "template_file" "nginx" {
  template = "${file("${path.module}/template/install_nginx.tpl")}"

}

resource "google_compute_instance" "public-vm" {
  depends_on   = [module.public-subnet]
  project      = var.project
  name         = "public-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network    = module.network_vpc.network_name
    subnetwork = "public-subnet"
    subnetwork_project = var.project
    access_config {}
  }
  tags = ["public-server"]


  metadata_startup_script = data.template_file.nginx.rendered
}



resource "google_compute_instance" "private-vm" {
  depends_on   = [module.private-subnet]
  project      = var.project
  name         = "private-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network    = module.network_vpc.network_name
    subnetwork = "private-subnet"
    subnetwork_project = var.project
    access_config {}
  }
  tags = ["private-server"]


  metadata_startup_script = data.template_file.nginx.rendered

}
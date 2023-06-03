terraform {
  backend "gcs" {
    bucket  = "terraform-backend-bucket-9020"
    prefix  = "terraform/state"
  }
}

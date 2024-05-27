terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.30.0"
    }
  }
  backend "gcs" {
    prefix = "state/gke"
    bucket = "k8s-bucket-tfstate-rand"
  }
}

provider "google" {
  project     = var.gcp_project_id
  region      = var.region
  credentials = "dtonic-demo-k8s.json"
}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}
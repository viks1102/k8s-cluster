module "gke" {
  # source                     = "terraform-google-modules/kubernetes-engine/google"
  source                     = "github.com/terraform-google-modules/terraform-google-kubernetes-engine?ref=v30.3.0"
  project_id                 = var.gcp_project_id
  name                       = var.cluster_name1
  region                     = var.region
  regional                   = var.regional
  zones                      = var.zones
  network                    = var.vpc_network
  subnetwork                 = var.vpc_subnet
  ip_range_pods              = ""
  ip_range_services          = ""
  http_load_balancing        = false
  network_policy             = false
  horizontal_pod_autoscaling = true
  filestore_csi_driver       = false
  deletion_protection        = false

  node_pools = [
    {
      name                      = "non-prod"
      machine_type              = "e2-medium"
      min_count                 = 1
      max_count                 = 3
      local_ssd_count           = 0
      spot                      = false
      disk_size_gb              = 50
      disk_type                 = "pd-standard"
      image_type                = "COS_CONTAINERD"
      enable_gcfs               = false
      enable_gvnic              = false
      logging_variant           = "DEFAULT"
      auto_repair               = true
      auto_upgrade              = true
      service_account           = "terraform-k8s-sa@dtonic-demo-k8s.iam.gserviceaccount.com"
      preemptible               = true
      initial_node_count        = 2
      deletion_protection       = false
      
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}

# module "gke1" {
#   source                     = "terraform-google-modules/kubernetes-engine/google"
#   project_id                 = var.gcp_project_id
#   name                       = var.cluster_name2
#   region                     = var.region
#   regional                   = var.regional
#   zones                      = var.zones
#   network                    = var.vpc_network
#   subnetwork                 = var.vpc_subnet
#   ip_range_pods              = ""
#   ip_range_services          = ""
#   http_load_balancing        = false
#   network_policy             = false
#   horizontal_pod_autoscaling = true
#   filestore_csi_driver       = false
#   deletion_protection        = false

#   node_pools = [
#     {
#       name                      = "prod"
#       machine_type              = "e2-medium"
#       min_count                 = 1
#       max_count                 = 3
#       local_ssd_count           = 0
#       spot                      = false
#       disk_size_gb              = 50
#       disk_type                 = "pd-standard"
#       image_type                = "COS_CONTAINERD"
#       enable_gcfs               = false
#       enable_gvnic              = false
#       logging_variant           = "DEFAULT"
#       auto_repair               = false
#       auto_upgrade              = false
#       service_account           = "terraform-k8s-sa@dtonic-demo-k8s.iam.gserviceaccount.com"
#       preemptible               = true
#       initial_node_count        = 1
#       deletion_protection       = false
#     },
#   ]

#   node_pools_oauth_scopes = {
#     all = [
#       "https://www.googleapis.com/auth/logging.write",
#       "https://www.googleapis.com/auth/monitoring",
#     ]
#   }
# }

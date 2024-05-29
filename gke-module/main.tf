module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  # source                     = "github.com/terraform-google-modules/terraform-google-kubernetes-engine?ref=v30.3.0"
  project_id                 = var.gcp_project_id
  name                       = var.cluster_name
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
      name                      = var.gke_node_pool
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
      auto_repair               = false
      auto_upgrade              = false
      service_account           = var.gke_service_account
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

  # node_pools_labels = {
  #   all = {}

  #   default-node-pool = {
  #     default-node-pool = true
  #   }
  # }

  # node_pools_metadata = {
  #   all = {}

  #   default-node-pool = {
  #     node-pool-metadata-custom-value = "my-node-pool"
  #   }
  # }

  # node_pools_taints = {
  #   all = []

  #   default-node-pool = [
  #     {
  #       key    = "default-node-pool"
  #       value  = true
  #       effect = "PREFER_NO_SCHEDULE"
  #     },
  #   ]
  # }

  # node_pools_tags = {
  #   all = []

  #   default-node-pool = [
  #     "default-node-pool",
  #   ]
  # }
}
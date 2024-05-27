project     = "dtonic-demo-k8s"
region      = "us-central1"
cluster_name = "gke-cluster-dev"
zones      = ["us-central1-a", "us-central1-b", "us-central1-f"]
regional    = false
vpc_network  = "k8s-vpc"   
vpc_subnet   = "private"
gke-node-pool = "ops"
gke-service-account = "terraform-k8s-sa@dtonic-demo-k8s.iam.gserviceaccount.com"
cluster_autoscaling = {
  enabled        = true
  min_node_count = 1
  max_node_count = 5
}
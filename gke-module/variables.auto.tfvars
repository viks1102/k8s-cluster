gcp_project_id      = "dtonic-demo-k8s"
region              = "us-central1"
cluster_name1       = "dev-gke"
# cluster_name2       = "prod-gke"
zones               = ["us-central1-a", "us-central1-b", "us-central1-f"]
regional            = false
vpc_network         = "k8s-vpc"
vpc_subnet          = "private"
# gke_node_pool1      = "non-prod"
# gke_node_pool2      = "prod"
# gke_service_account = "terraform-k8s-sa@dtonic-demo-k8s.iam.gserviceaccount.com"



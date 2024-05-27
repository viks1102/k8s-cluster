variable "gcp_project_id" {
    type = string
    description = "Project ID"
}
variable "region" {
    type = string
    description = "this is for cluster region"
}

variable "cluster_name" {
    type = string
    description = "Cluster name"
}
variable "zones" {
    type = list(string)
    description = "List of Zones"
}

variable "regional" {
    type = bool
    description = "Regional or Not"
}

variable "vpc_network" {
    type = string

    description = "VPC network name"
}
variable "vpc_subnet" {
    type = string
    description = "VPC Subnet"
}
variable "gke_node_pool" {
    type = string
    description = "gke-node-pool name"
}

variable "gke_service_account" {
    type = string
    description = "gke service account name"
}

variable "ip_range_pods" {
    type = string
    description = "ip pod range"
}

variable "ip_range_services" {
    type = string
    description = "ip service range"
}

# variable "cluster_autoscaling" {
#   type = object({
#     enabled             = bool
#     autoscaling_profile = string
#     min_cpu_cores       = number
#     max_cpu_cores       = number
#     min_memory_gb       = number
#     max_memory_gb       = number
#     gpu_resources       = list(object({ resource_type = string, minimum = number, maximum = number }))
#     auto_repair         = bool
#     auto_upgrade        = bool
#     disk_size           = optional(number)
#     disk_type           = optional(string)
#   })
#   default = {
#     enabled             = false
#     autoscaling_profile = "BALANCED"
#     max_cpu_cores       = 0
#     min_cpu_cores       = 0
#     max_memory_gb       = 0
#     min_memory_gb       = 0
#     gpu_resources       = []
#     auto_repair         = true
#     auto_upgrade        = true
#     disk_size           = 100
#     disk_type           = "pd-standard"
#   }
#   description = "Cluster autoscaling configuration. See [more details](https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.locations.clusters#clusterautoscaling)"
# }
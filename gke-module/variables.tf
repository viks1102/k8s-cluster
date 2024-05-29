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

# variable "ip_range_pods" {
#     type = string
#     description = "ip pod range"
# }

# variable "ip_range_services" {
#     type = string
#     description = "ip service range"
# }
output "kubernetes_cluster_id" {
    description = "Map of Kubernetes Cluster IDs keyed by cluster name"
    value       = { for k8s in azurerm_kubernetes_cluster.DevOps_kubernetes_cluster : k8s.name => k8s.id }
}
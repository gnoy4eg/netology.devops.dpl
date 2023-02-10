output "external_v4_endpoint" {
  value = yandex_kubernetes_cluster.k8s_regional_cluster.master[0].external_v4_endpoint
}

output "internal_v4_endpoint" {
  value = yandex_kubernetes_cluster.k8s_regional_cluster.master[0].internal_v4_endpoint
}

output "cluster_ca_certificate" {
  value = yandex_kubernetes_cluster.k8s_regional_cluster.master[0].cluster_ca_certificate
}

output "cluster_id" {
  value = yandex_kubernetes_cluster.k8s_regional_cluster.id
}

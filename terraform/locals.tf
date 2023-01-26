locals {
  ws = var.TFC_WORKSPACE_NAME != "" ? (
    trimprefix(var.TFC_WORKSPACE_NAME, "yc-")
    ) : (
    trimprefix(terraform.workspace, "yc-")
  )

  networks = [
    {
      zone_name = "ru-central1-a"
      subnet    = ["192.168.10.0/24"]
    },
    {
      zone_name = "ru-central1-b"
      subnet    = ["192.168.11.0/24"]
    },
    {
      zone_name = "ru-central1-c"
      subnet    = ["192.168.12.0/24"]
    }
  ]

  cloud_id  = "aje4o75no91tn71jgisd"
  folder_id = "b1gurqobqm3qcn2l5eem"
  default_zone = local.networks.0.zone_name
  dns_zone     = "yc.complife.ru"
  cluster_name = "kube-cluster"
  control_url  = "${local.cluster_name}.${local.dns_zone}"
  ingress_url  = "${local.cluster_name}-ingress.${local.dns_zone}"

  k8s_cluster_resources = {
    stage = {
      masters = {
        count       = 1
        cpu         = 4
        memory      = 4
        disk        = 93
        disk_type   = "network-ssd-nonreplicated"
        preemptible = false
      }
      workers = {
        count       = 3
        cpu         = 2
        memory      = 4
        disk        = 20
        disk_type   = "network-ssd"
        preemptible = false
      }
    }
    prod = {
      masters = {
        count       = 1
        cpu         = 4
        memory      = 4
        disk        = 93
        disk_type   = "network-ssd-nonreplicated"
        preemptible = false
      }
      workers = {
        count       = 6
        cpu         = 2
        memory      = 4
        disk        = 20
        disk_type   = "network-ssd"
        preemptible = false
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "pvc-redis" {
  metadata {
    name = "pvc-redis"
    namespace = var.namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    storage_class_name = "standard"
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}
resource "kubernetes_persistent_volume_claim" "pvc-postgres" {
  metadata {
    name = "pvc-postgres"
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
resource "kubernetes_deployment" "postgres-prod-deployment" {
  metadata {
    name = "postgres-prod"
    namespace = var.namespace
    labels = {
      App = "postgres-prod"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        App = "postgres-prod"
      }
    }

    template {
      metadata {
        labels = {
          App = "postgres-prod"
        }
      }

      spec {
        restart_policy = "Always"
        container {
          image = "postgres:11-alpine"
          name  = "postgres-prod"
          port {
            container_port = 5432
            protocol = "TCP"
          }
          env_from {
             config_map_ref {
                    name = "weblate-prod-configmap"
            }
          }
          volume_mount {
            mount_path = "/var/lib/postgresql/data"
            name       = "postgres-data"
            sub_path = "postgres"
          }
        }
        volume {
          name = "postgres-data"
          persistent_volume_claim {
            claim_name = "pvc-postgres"
          }
        }
      }
    }
  }
}
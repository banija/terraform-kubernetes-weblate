resource "kubernetes_deployment" "redis-prod-deployment" {
  metadata {
    name = "redis-prod"
    namespace = var.namespace
    labels = {
      App = "redis-prod"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        App = "redis-prod"
      }
    }

    template {
      metadata {
        labels = {
          App = "redis-prod"
        }
      }

      spec {
        restart_policy = "Always"
        container {
          image = "redis:5-alpine"
          name  = "redis-prod"
          command = ["redis-server", "--appendonly", "yes"]
          port {
            container_port = 6379
            protocol = "TCP"
          }
          env_from {
             config_map_ref {
                    name = "weblate-prod-configmap"
            }
          }
          volume_mount {
            mount_path = "/data"
            name       = "redis-data"
          }
        }
        volume {
          name = "redis-data"
          persistent_volume_claim {
            claim_name = "pvc-redis"
          }
        }
      }
    }
  }
}
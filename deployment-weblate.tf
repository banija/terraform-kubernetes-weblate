resource "kubernetes_deployment" "weblate-prod-deployment" {
  metadata {
    name = "weblate-prod"
    namespace = var.namespace
    labels = {
      App = "weblate-prod"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        App = "weblate-prod"
      }
    }

    template {
      metadata {
        labels = {
          App = "weblate-prod"
          redis-client = "true"
        }
      }

      spec {
        restart_policy = "Always"
        security_context{
          run_as_user = "1000"
          run_as_group = "1000"
        }
        container {
          image = "weblate/weblate"
          name  = "weblate-prod"
          port {
            container_port = 8080
            name = "http"
            protocol = "TCP"
          }
          env_from {
             config_map_ref {
                    name = "weblate-prod-configmap"
            }
          }
          volume_mount {
            mount_path = "/app/data"
            name       = "weblate-data"
          }
        }
        volume {
          name = "weblate-data"
          persistent_volume_claim {
            claim_name = "pvc-weblate"
          }
        }
      }
    }
  }
}
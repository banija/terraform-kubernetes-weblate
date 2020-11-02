resource "kubernetes_ingress" "weblate-prod-ingress" {
  metadata {
    name = "weblate-ingress"
    namespace = var.namespace
  }

  spec {
    backend {
      service_name = "service-weblate-prod"
      service_port = 8080
    }

    rule {
      http {
        path {
          backend {
            service_name = "service-weblate-prod"
            service_port = 8080
          }

          path = "/"
        }
      }
    }
  }
}
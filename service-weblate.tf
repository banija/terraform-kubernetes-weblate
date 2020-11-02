resource "kubernetes_service" "service-weblate" {
  metadata {
    name = "service-weblate-prod"
    namespace = var.namespace
  }
  spec {
    selector = {
      App = kubernetes_deployment.weblate-prod-deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 8080
      target_port = 8080
    }
    external_ips = ["146.148.110.235",
                    "34.70.139.17",
                    "104.198.234.63"]
  }
}
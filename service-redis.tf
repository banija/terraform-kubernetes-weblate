resource "kubernetes_service" "service-redis" {
  metadata {
    name = "service-redis-prod"
    namespace = var.namespace
  }
  spec {
    selector = {
      App = kubernetes_deployment.redis-prod-deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 6379
      target_port = 6379
    }
  }
}
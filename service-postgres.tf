resource "kubernetes_service" "service-postgres" {
  metadata {
    name = "service-postgres-prod"
    namespace = var.namespace
  }
  spec {
    selector = {
      App = kubernetes_deployment.postgres-prod-deployment.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 5432
      target_port = 5432
    }
  }
}
resource "kubernetes_namespace" "weblate-prod" {
  metadata {

    labels = {
      mylabel = "weblate-prod"
    }

    name = var.namespace
  }
}
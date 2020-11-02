resource "kubernetes_config_map" "weblate-prod-configmap" {
  metadata {
    name = "weblate-prod-configmap"
    namespace = var.namespace
  }

  data = {
    POSTGRES_DATABASE = "weblate"
    POSTGRES_HOST= "service-postgres-prod"
    POSTGRES_PASSWORD= "weblate"
    POSTGRES_PORT= ""
    POSTGRES_USER= "weblate"
    REDIS_HOST= "service-redis-prod"
    REDIS_PORT= "6379"
    WEBLATE_ADMIN_EMAIL= "weblate@example.com"
    WEBLATE_ADMIN_NAME= "admin"
    WEBLATE_ADMIN_PASSWORD= "admin"
    WEBLATE_ALLOWED_HOSTS= "*"
    WEBLATE_DEBUG= "0"
    WEBLATE_DEFAULT_FROM_EMAIL= "weblate@example.com"
    WEBLATE_EMAIL_HOST= "127.0.0.1"
    WEBLATE_EMAIL_HOST_PASSWORD= ""
    WEBLATE_EMAIL_HOST_USER= ""
    WEBLATE_LOGLEVEL= "DEBUG"
    WEBLATE_REGISTRATION_OPEN= "1"
    WEBLATE_SERVER_EMAIL= "weblate@example.com"
    WEBLATE_SITE_TITLE= "Weblate"
  }

}
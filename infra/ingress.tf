resource "kubernetes_ingress_v1" "mlflow" {
  metadata {
    name = "mlflow"
    namespace = "nanogpt"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target": "/"
    }
  }
  spec {
    ingress_class_name = "nginx"
    rule {
      host = "mlflow.local"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = kubernetes_service_v1.mlflow-service.metadata[0].name
              port {
                name = kubernetes_service_v1.mlflow-service.spec[0].port[0].name
                number = kubernetes_service_v1.mlflow-service.spec[0].port[0].port
              }
            }
          }
        }
      }
    }
  }
}
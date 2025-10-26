resource "kubernetes_service_v1" "mlflow-service" {
  metadata {
    name = "mlflow-service"
    namespace = "nanogpt"
  }
  spec {
    type = "NodePort"
    selector = {
      "app.kubernetes.io/name": "mlflow-server"
    }
    port {
      port = 5000
      protocol = "TCP"
      target_port = "http"
    }
  }
}
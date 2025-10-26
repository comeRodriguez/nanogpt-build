resource "kubernetes_service_v1" "mlflow-service" {
  metadata {
    name = "mlflow-service"
    namespace = "nanogpt"
  }
  spec {
    type = "LoadBalancer"
    selector = {
      "app.kubernetes.io/name": "mlflow-server"
    }
    port {
      port = 80
      protocol = "TCP"
      target_port = kubernetes_deployment_v1.mlflow.spec[0].template[0].spec[0].container[0].port[0].container_port
    }
  }
}
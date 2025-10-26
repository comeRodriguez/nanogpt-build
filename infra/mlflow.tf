resource "kubernetes_deployment_v1" "mlflow" {
  metadata {
    name = "mlflow-server"
    namespace = "nanogpt"
  }
  spec {
    replicas = "1"
    selector {
      match_labels = {
        app: "mlflow-server"
      }
    }
    template {
      metadata {
        name = "mlflow-server"
        namespace = "nanogpt"
        labels = {
          app: "mlflow-server"
        }
      }
      spec {
        container {
          name = "mlflow"
          image = "mlflow-base-image:0.0.1a0"
          image_pull_policy = "Never"
          args = [
            "--host=0.0.0.0",
            "--port=5000",
            "--backend-store-uri=/opt/mlflow/backend/",
            "--default-artifact-root=/opt/mlflow/artifacts/",
            "--workers=2"
          ]
          port {
            container_port = 5000
            name = "http"
            protocol = "TCP"
          }
          volume_mount {
            mount_path = "/opt/mlflow"
            name       = "mlflow-pvc"
          }
        }
        volume {
          name = "mlflow-pvc"
          host_path {
            path = "/mlflow"
            type = "Directory"
          }
        }
      }
    }
  }
}
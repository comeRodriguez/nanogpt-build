resource "kubernetes_persistent_volume_claim_v1" "mlflow-pvc-claim" {
  metadata {
    name = "mlflow-pvc"
    namespace = "nanogpt"
  }
  spec {
    storage_class_name = "standard"
    access_modes = ["ReadWriteMany"]
    resources {
      requests = {
        storage: "500Mi"
      }
    }
  }
}

resource "kubernetes_persistent_volume_v1" "mlflow-pvc" {
  metadata {
    name = "mlflow-pvc"
  }
  spec {
    storage_class_name = "standard"
    access_modes = ["ReadWriteMany"]
    capacity = {
      storage: "5Gi"
    }
    persistent_volume_source {
      host_path {
        path = "/mlflow"
      }
    }
  }
}
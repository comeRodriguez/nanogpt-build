resource "kubernetes_namespace_v1" "nanogpt" {
  metadata {
    name = "nanogpt"
  }
}
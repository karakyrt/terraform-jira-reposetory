resource "kubernetes_persistent_volume" "jira" {
    metadata {
        name = "jira-pv"
    }
    spec {
        capacity {
            storage = "20Gi"
        }
        access_modes = ["ReadWriteMany"]
        persistent_volume_source {
            vsphere_volume {
                volume_path = "/opt/jira-pv"
            }
        }
    }
}

resource "kubernetes_deployment" "jira-deployment" {
  metadata {
    name      = "jira-test"

    labels {
      test = "jira"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        test = "jira"
      }
    }

    template {
      metadata {
        labels {
          test = "jira"
        }
      }

      spec {
        volume {
          name = "jira-pv"
}
        container {
          image = "gcr.io/hightowerlabs/jira:7.3.6-standalone"
          name  = "jira"
          volume_mount {
            name  =  "jira-pv"
            mount_path   =   "/opt/jira"            
}
        }
      }
    }
  }
}


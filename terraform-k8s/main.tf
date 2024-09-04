# main.tf

# Configure the Kubernetes provider
provider "kubernetes" {
  config_path = "~/.kube/config" # Adjust this path if your kubeconfig is located elsewhere
  config_context = "minikube"    # Ensure this matches the context in your kubeconfig
}

# Define a Kubernetes Deployment
resource "kubernetes_deployment" "app" {
  metadata {
    name = "devops-practical"
    labels = {
      app = "devops-practical"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "devops-practical"
      }
    }

    template {
      metadata {
        labels = {
          app = "devops-practical"
        }
      }

      spec {
        container {
          name  = "devops-practical"
          image = "jyothicloud24/devops-practical-app:latest"

          port {
            container_port = 3000
          }

          env {
            name  = "NODE_ENV"
            value = "development"
          }

          env {
            name  = "MONGO_URL"
            value = "mongodb://root:example@mongodb:27017/devopsdb?authSource=admin"
          }
        }
      }
    }
  }
  timeouts {
    create = "30m"
    delete = "20m"
  }
}

# Define a Kubernetes Service
resource "kubernetes_service" "app" {
  metadata {
    name = "devops-practical"
  }

  spec {
    selector = {
      app = "devops-practical"
    }

    port {
      port        = 80
      target_port  = 3000
    }

    # Use NodePort instead of LoadBalancer for Minikube
    type = "NodePort"
  
  }
 # timeouts {
  #  create = "30m"
   # delete = "20m"
  #}
}

# Define a Kubernetes ConfigMap (if needed)
resource "kubernetes_config_map" "app_config" {
  metadata {
    name = "app-config"
  }

  data = {
    "config.json" = jsonencode({
      "key" = "value"
    })
  }
}

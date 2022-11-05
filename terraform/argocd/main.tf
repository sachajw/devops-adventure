terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.0.14"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14.0"
    }

    helm = {
      source  = "hashicorp/helm"
      version = "2.7.1"
    }
  }
}

provider "kind" {}

resource "kind_cluster" "default" {
  name           = "ortelius-in-a-box"
  wait_for_ready = true
  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }

    node {
      role  = "worker"
      image = "kindest/node:v1.25.2"
    }
  }
}

provider "kubectl" {
  host                   = kind_cluster.default.endpoint
  cluster_ca_certificate = kind_cluster.default.cluster_ca_certificate
  client_certificate     = kind_cluster.default.client_certificate
  client_key             = kind_cluster.default.client_key
}

provider "helm" {
  debug = true
  kubernetes {
    host                   = kind_cluster.default.endpoint
    cluster_ca_certificate = kind_cluster.default.cluster_ca_certificate
    client_certificate     = kind_cluster.default.client_certificate
    client_key             = kind_cluster.default.client_key

  }
}

resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "5.6.2"
  create_namespace = true

  values = [
    file("argocd/application.yaml")
  ]
}

resource "helm_release" "ortelius" {
  name             = "ortelius"
  repository       = "https://github.com/ortelius/ortelius-charts" #"https://github.com/DeployHubProject/DeployHub-Pro" #dirname("~/Documents/repos/tvl/ortelius-charts/chart") #"https://github.com/sachajw/ortelius-charts" #"https://deployhubproject.github.io/DeployHub-Pro/" #"https://github.com/ortelius/ortelius/index.yaml"
  chart            = "ortelius"
  version          = "10.0.0"
  namespace        = "ortelius"
  create_namespace = true

  values = [
    file("argocd/application.yaml")
  ]
}

#resource "helm_release" "keptn" {
#  name = "keptn"
#
#  repository       = "https://charts.keptn.sh"
#  chart            = "keptn"
#  namespace        = "keptn"
#  version          = "0.19.1"
#  create_namespace = true
#
#  values = [
#    file("argocd/application.yaml")
#  ]
#}

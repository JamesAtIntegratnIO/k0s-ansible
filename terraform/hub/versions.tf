terraform {
  required_providers {

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.31.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.10.1"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.39.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "../../ansible/artifacts/k0s-kubeconfig.yml"
  config_context = "Default"
}

provider "helm" {
  kubernetes {
    config_path    = "../../ansible/artifacts/k0s-kubeconfig.yml"
    config_context = "Default"
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_key
}
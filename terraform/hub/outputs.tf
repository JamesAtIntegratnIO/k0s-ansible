output "kubeconfig" {
  value     = module.cluster.kubeconfig
  sensitive = true
}

output "access_argocd" {
  description = "ArgoCD Access"
  value       = <<EOF
    echo "ArgoCD Username: admin"
    echo "ArgoCD Password: $(kubectl get secrets argocd-initial-admin-secret -n argocd --template="{{index .data.password | base64decode}}")"
    echo "ArgoCD URL: https://$(kubectl get ingress -n argocd argo-cd-argocd-server -o jsonpath='{.spec.rules[0].host}')"
    EOF
}

output "configure_kubectl" {
  description = "Update your ~/.kube/config with kubecm and switch to the new context"
  value       = <<EOF
    kubecm add kubeconfig -f kubeconfig -c
    kubecm switch admin@${var.cluster_name}
    EOF
}
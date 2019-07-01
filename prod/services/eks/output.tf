#
# Outputs
#

locals {
  config_map_aws_auth = <<CONFIGMAPAWSAUTH


apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
  
    - rolearn: ${data.terraform_remote_state.iam.eks_node_arn}
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
CONFIGMAPAWSAUTH

  kubeconfig = <<KUBECONFIG


apiVersion: v1
clusters:
- cluster:
    server: ${module.eks-cluster.endpoint}
    certificate-authority-data: ${module.eks-cluster.certificate_authority}
  name: kubernetes
contexts:
- context:
    cluster: kubernetes
    user: aws
  name: aws
current-context: aws
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws-iam-authenticator
      args:
        - "token"
        - "-i"
        - "${var.name}"
KUBECONFIG
  version = "${module.eks-cluster.version}"
}
output "config_map_aws_auth" {
  value = "${local.config_map_aws_auth}"
}
output "kubeconfig" {
  value = "${local.kubeconfig}"
}
output "version" {
  value = "${local.version}"
}
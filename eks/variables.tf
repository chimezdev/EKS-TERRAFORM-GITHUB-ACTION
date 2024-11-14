
# EKS
variable "is-eks-cluster-enabled" {}
variable "cluster-version" {}
variable "endpoint-private-access" {}
variable "endpoint-public-access" {}
variable "ondemand_instance_types" {
  default = ["t3a.medium"]
}

variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))
}


resource "aws_eks_cluster" "eks" {
    count = var.is-eks-cluster-enable == true ? : 0
    name = var.cluster-name
    role_arn = aws_iam_role.eks-cluster-role[count.index].arn
    version = var.cluster-version

    vpc_config {
        subnet_ids = [aws_subnet.private-subnet[0].id, aws_subnet.private-subnet[1].id, aws_subnet.private-subnet[2].id]
        endpoint_private_access = var.endpoint-private-access
        endpoint_public_access = var.endpoint-public-access
        security_group_ids = [aws_security_group.eks-cluster-sg.id]
    }

    access_config {
        authentication_mode = "CONFIG_MAP"
        bootstrap_cluster_creator_admin_permissions = true
    }

    tags = {
      Name = var.cluster-name
      Env  = var.env 
    }
}

# OIDC Provider

resource "aws_iam_openid_connect_provider" "eks-oidc" {
    client_id_list = ["sts.amazonaws.com"]
    thumbprint_list = [data.tls_certificate.eks-certificate.certificate[0].sha1_fingerprint]
    url = data.tls_certificate.eks-certificate.url
}

# AddOns for EKS Cluster
resource "aws_eks_addon" "eks-addons" {
    for_each = {for idx, addon in var.addons : idx => addon }
    cluster_name = aws_eks_cluster.eks[0].name
    addon_name = each.value.name
    addon_version = each.value.version

    depends_on = [ aws_eks_node_group.ondemand-node, aws_eks_node_group.spot-node ]
}

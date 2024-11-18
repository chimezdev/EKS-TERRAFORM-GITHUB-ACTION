
# fetches the TLS certificate(auto provisioned by aws) for our EKS cluster with IAM policy which is dedicated to OIDC.
data "tls_certificate" "eks-certificate" { #the cert is used to protect the oidc url
  url = aws_eks_cluster.eks[0].identity[0].oidc[0].issuer
}

data "aws_iam_policy_document" "eks_oidc_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"

    condition {
      test     = "StringEquals"
      variable = "${replace(aws_iam_openid_connect_provider.eks-oidc.url, "https://", "")}:sub" # removes 'https://' from oidc url, append :sub
      values   = ["system:serviceaccount:default:aws-test"] #can only be assumed by service acc. aws-test in default ns
    }

    principals {
      identifiers = [aws_iam_openid_connect_provider.eks-oidc.arn]
      type        = "Federated"
    }
  }
}




env                   = "dev"
aws-region            = "eu-west-1"
vpc-cidr-block        = "10.16.0.0/16"
vpc-name              = "eks-github-action-vpc"
igw-name              = "eks-github-action-igw"
pub-subnet-count      = 3
pub-cidr-block        = ["10.16.0.0/20", "10.16.16.0/20", "10.16.32.0/20"]
pub-availability-zone = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
pub-sub-name          = "eks-github-action-pub-sub"
pri-subnet-count      = 3
pri-cidr-block        = ["10.16.128.0/20", "10.16.144.0/20", "10.16.160.0/20"]
pri-availability-zone = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
pri-sub-name          = "eks-github-action-priv-sub"
public-rt-name        = "eks-github-action-pub-rt"
private-rt-name       = "eks-github-action-priv-rt"
eip-name              = "eks-github-action-eip"
ngw-name              = "eks-github-action-ngw"
eks-sg                = "eks-github-action-eks-sg"

# EKS
# is_eks_role_enabled        = true
# is_eks_nodegroup_role_enabled = true
is-eks-cluster-enabled     = true
cluster-version            = "1.31"
cluster-name               = "eks-github-action-cluster"
endpoint-private-access    = true
endpoint-public-access     = false
ondemand_instance_types    = ["t3a.small"]
spot_instance_types        = ["c5a.large", "c5a.xlarge", "m5a.large", "m5a.xlarge", "c5.large", "m5.large", "t3a.large", "t3a.medium", "t3a.small"]
desired_capacity_on_demand = "1"
min_capacity_on_demand     = "1"
max_capacity_on_demand     = "2"
desired_capacity_spot      = "1"
min_capacity_spot          = "1"
max_capacity_spot          = "3"
addons = [
  {
    name    = "vpc-cni",
    version = "v1.18.1-eksbuild.1"
  },
  {
    name    = "coredns"
    version = "v1.11.1-eksbuild.9"
  },
  {
    name    = "kube-proxy"
    version = "v1.29.3-eksbuild.2"
  },
  {
    name    = "aws-ebs-csi-driver"
    version = "v1.30.0-eksbuild.1"
  }
  # Add more addons as needed
]
multi-policy = ["arn:aws:iam::aws:policy/AmazonEKSClusterPolicy", "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"]

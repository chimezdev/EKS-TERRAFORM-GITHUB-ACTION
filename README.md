# PROVISIONING OF PRODUCTION-READY AMAZON EKS CLUSTER WITH TERRAFORM AND GITHUB ACTIONS

[![LinkedIn](https://img.shields.io/badge/Connect%20with%20me%20on-LinkedIn-blue.svg)](https://www.linkedin.com/in/livingstone-chimezie)
[![Medium](https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white)](https://medium.com/@ochuba)
[![GitHub](https://img.shields.io/github/stars/AmanPathak-DevOps.svg?style=social)](https://github.com/chimezdev))
[![AWS](https://img.shields.io/badge/AWS-%F0%9F%9B%A1-orange)](https://aws.amazon.com)
[![Serverless](https://img.shields.io/badge/Serverless-%E2%9A%A1%EF%B8%8F-blueviolet)](https://www.serverless.com)
[![Terraform](https://img.shields.io/badge/Terraform-%E2%9C%A8-lightgrey)](https://www.terraform.io)

![EKS- GitHub Actions- Terraform](assets/Presentation1.gif)

This repository **Provisioning of Production-Ready Amazon EKS Clusters with Terraform and Automating Deployment with GitHub Actions** accompanies a blog post by @AmanPathak-DevOps and demonstrates the practical steps to set up and automate an EKS cluster deployment. See original blog post here: ![Aman Pathak](https://blog.stackademic.com/configuring-production-ready-eks-clusters-with-terraform-and-github-actions-c046e8d44865)

## Project Overview
This project covers:
- **Infrastructure as Code (IaC)**: Use Terraform to define and manage your EKS cluster.
- **CI/CD Automation**: Leverage GitHub Actions to automate deployments.
- **Kubernetes Deployment using AWS Kubernetes offering EKS

## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License
This project is licensed under the Apache 2.0 License. See the [LICENSE](LICENSE) file for details.

## Pre-reuisites
You need to understand the following in other to make the best out of this project.

-   Must have an AWS Account. Preferrably an AWS freetier account
-   Must have AWS IAM credentials with Administrator Access(always avoid Administrator Access and follow the least privileged permissions)
-   Have a good understanding of Terraform
-   Have basic understanding of YAML files for GitHub Actions workflow.

### Directory Structure
[Directory structure](assets/)

**module directory** - Contains the resource scripts related to the EKS cluster and it’s required service(IAM, VPC, etc).

**eks directory** - Here, we will create the resources according to our requirements and we will call the resources module from module directory.

Lets begin with the module directory files:

> gather.tf
See the file ***/module/gather.tf*** Read the comments to understand what the certificate does.

> vpc.tf
See file /module/vpc.tf. Setup for AWS services related to VPC including VPC, internet gateway, public subnet and private subnets(with the desired number of subnets), public and private route tables respective to their type of subnets, NAT Gateway, elastic IP (required for NAT Gateway), security group for EKS cluster to restrict the access for specific people only

> iam.tf
Created roles for our EKS cluster and node group, **AmazonEKSClusterPolicy**. Along with that, we have created an OIDC role for our EKS Cluster.

> eks.tf
Here we configured private AWS EKS cluster and Private node groups.

In the configuration, we are creating two node groups types. First is ON-DEMAND type and the other is SPOT type to cost-optimize the cloud.

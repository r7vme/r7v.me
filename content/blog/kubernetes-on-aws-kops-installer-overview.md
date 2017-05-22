+++
date = "2017-05-22"
title = "Kubernetes on AWS: kops installer overview"

+++
## Intro

Kubernetes is a platform for container orchestraion.
Amazon Web Services is most popular platform for virtual infrastructure. There
are a multiple options to install Kubernetes on AWS.

- [kops](https://github.com/kubernetes/kops)
- [tectonic installer](https://github.com/coreos/tectonic-installer)
- [kube-aws](https://github.com/kubernetes-incubator/kube-aws)
- etc.

In this post i'll try to overview [kops](https://github.com/kubernetes/kops) (aka Kubernetes Operations).

## kops overview

kops authors describe it with

> Kubernetes Operations (kops) - Production Grade K8s Installation, Upgrades, and Management

* [Golang based](https://github.com/kubernetes/kops)
* Kubernetes-like format (yaml) to describe clusters/instance groups/etc.
* Can produce configurations in Terraform or CloudFormation format.
* Debian as operating system for k8s. [See about other OS support.](https://github.com/kubernetes/kops/blob/master/docs/images.md)
* [Multi-master k8s supported](https://github.com/kubernetes/kops/blob/master/docs/high_availability.md)
* Kubenet by default. Also [supports CNI](https://github.com/kubernetes/kops/blob/master/docs/networking.md)



## Install Kubernetes with kops

### Get kops

```bash
sudo wget https://github.com/kubernetes/kops/releases/download/1.6.0/kops-linux-amd64 -O /usr/local/bin/kops
sudo chmod +x /usr/local/bin/kops
```

### Prerequisites

Before proceed with Kubernetes installation make sure:

* `kubectl` installed
* `aws` cli configured
* [AWS Route53 hosted zone](https://github.com/kubernetes/kops/blob/master/docs/aws.md) - `aws route53 list-hosted-zones`
* AWS S3 bucket - `aws s3 ls`
* `terraform` installed (Optional)

### Let kops generate Terraform config

By default kops creates resources using AWS APIs directly. In this post i'm using Terraform. If you want to proceed with default deployment just remove `--target=terraform`.

Command below will inspect AWS for necessary resources (e.g. route53 hosted zone), generate necessary artifacts (see below) and produce `terraform` configuration file. Options details [here.](https://github.com/kubernetes/kops/blob/master/docs/cli/kops_create_cluster.md)

Kubernetes configuration to be deployed:

- Kubernetes version 1.6.2 (for May 2017)
- Single k8s master plus two vms (1+2). For multi-master see [here](https://github.com/kubernetes/kops/blob/master/docs/advanced_create.md).
- [Kubenet AWS VPC networking](https://github.com/kubernetes/kops/blob/master/docs/networking.md)
- [Amazon EBS volume driver](https://kubernetes.io/docs/concepts/storage/volumes/#awselasticblockstore)

```bash
kops create cluster \
  --name=kubernetes.r7v.de \
  --out=. \
  --target=terraform \
  --state=s3://rsokolkov \
  --zones=us-east-1a
```

Terraform configuration in `kubernetes.tf`.

Cluster configuration can be found in s3 bucket:

`aws s3 ls s3://rsokolkov/kubernetes.r7v.de/`

#### Look inside

* [aws s3 ls s3://rsokolkov/kubernetes.r7v.de/ --recursive](/uploads/2017/kops-s3-files)
* [cluster.spec](/uploads/2017/cluster.spec)
* [kubernetes.tf](/uploads/2017/kubernetes.tf)


### Deploy Kubernetes with Terraform

```bash
terraform plan
terraform apply
```

Wait few minutes until DNS will propagate new entities.

Then check with

`kubectl get nodes`

## Manipulate cluster

To see list of clusters

```bash
kops get clusters --state=s3://rsokolkov
```

To edit configuration consult this [page](https://github.com/kubernetes/kops/blob/master/docs/changing_configuration.md) or to scale cluster check [other one](https://github.com/kubernetes/kops/blob/master/docs/instance_groups.md).

## Delete cluster

```bash
terraform destroy
kops delete cluster --name=kubernetes.r7v.de --state=s3://rsokolkov
```

# Links

- [kops source code](https://github.com/kubernetes/kops)
- [kops documentation](https://github.com/kubernetes/kops/tree/master/docs)

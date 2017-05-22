output "cluster_name" {
  value = "kubernetes.r7v.de"
}

output "master_security_group_ids" {
  value = ["${aws_security_group.masters-kubernetes-r7v-de.id}"]
}

output "masters_role_arn" {
  value = "${aws_iam_role.masters-kubernetes-r7v-de.arn}"
}

output "masters_role_name" {
  value = "${aws_iam_role.masters-kubernetes-r7v-de.name}"
}

output "node_security_group_ids" {
  value = ["${aws_security_group.nodes-kubernetes-r7v-de.id}"]
}

output "node_subnet_ids" {
  value = ["${aws_subnet.us-east-1a-kubernetes-r7v-de.id}"]
}

output "nodes_role_arn" {
  value = "${aws_iam_role.nodes-kubernetes-r7v-de.arn}"
}

output "nodes_role_name" {
  value = "${aws_iam_role.nodes-kubernetes-r7v-de.name}"
}

output "region" {
  value = "us-east-1"
}

output "vpc_id" {
  value = "${aws_vpc.kubernetes-r7v-de.id}"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_autoscaling_group" "master-us-east-1a-masters-kubernetes-r7v-de" {
  name                 = "master-us-east-1a.masters.kubernetes.r7v.de"
  launch_configuration = "${aws_launch_configuration.master-us-east-1a-masters-kubernetes-r7v-de.id}"
  max_size             = 1
  min_size             = 1
  vpc_zone_identifier  = ["${aws_subnet.us-east-1a-kubernetes-r7v-de.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kubernetes.r7v.de"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "master-us-east-1a.masters.kubernetes.r7v.de"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/master"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "nodes-kubernetes-r7v-de" {
  name                 = "nodes.kubernetes.r7v.de"
  launch_configuration = "${aws_launch_configuration.nodes-kubernetes-r7v-de.id}"
  max_size             = 2
  min_size             = 2
  vpc_zone_identifier  = ["${aws_subnet.us-east-1a-kubernetes-r7v-de.id}"]

  tag = {
    key                 = "KubernetesCluster"
    value               = "kubernetes.r7v.de"
    propagate_at_launch = true
  }

  tag = {
    key                 = "Name"
    value               = "nodes.kubernetes.r7v.de"
    propagate_at_launch = true
  }

  tag = {
    key                 = "k8s.io/role/node"
    value               = "1"
    propagate_at_launch = true
  }
}

resource "aws_ebs_volume" "a-etcd-events-kubernetes-r7v-de" {
  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "kubernetes.r7v.de"
    Name                 = "a.etcd-events.kubernetes.r7v.de"
    "k8s.io/etcd/events" = "a/a"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_ebs_volume" "a-etcd-main-kubernetes-r7v-de" {
  availability_zone = "us-east-1a"
  size              = 20
  type              = "gp2"
  encrypted         = false

  tags = {
    KubernetesCluster    = "kubernetes.r7v.de"
    Name                 = "a.etcd-main.kubernetes.r7v.de"
    "k8s.io/etcd/main"   = "a/a"
    "k8s.io/role/master" = "1"
  }
}

resource "aws_iam_instance_profile" "masters-kubernetes-r7v-de" {
  name = "masters.kubernetes.r7v.de"
  role = "${aws_iam_role.masters-kubernetes-r7v-de.name}"
}

resource "aws_iam_instance_profile" "nodes-kubernetes-r7v-de" {
  name = "nodes.kubernetes.r7v.de"
  role = "${aws_iam_role.nodes-kubernetes-r7v-de.name}"
}

resource "aws_iam_role" "masters-kubernetes-r7v-de" {
  name               = "masters.kubernetes.r7v.de"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_masters.kubernetes.r7v.de_policy")}"
}

resource "aws_iam_role" "nodes-kubernetes-r7v-de" {
  name               = "nodes.kubernetes.r7v.de"
  assume_role_policy = "${file("${path.module}/data/aws_iam_role_nodes.kubernetes.r7v.de_policy")}"
}

resource "aws_iam_role_policy" "masters-kubernetes-r7v-de" {
  name   = "masters.kubernetes.r7v.de"
  role   = "${aws_iam_role.masters-kubernetes-r7v-de.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_masters.kubernetes.r7v.de_policy")}"
}

resource "aws_iam_role_policy" "nodes-kubernetes-r7v-de" {
  name   = "nodes.kubernetes.r7v.de"
  role   = "${aws_iam_role.nodes-kubernetes-r7v-de.name}"
  policy = "${file("${path.module}/data/aws_iam_role_policy_nodes.kubernetes.r7v.de_policy")}"
}

resource "aws_internet_gateway" "kubernetes-r7v-de" {
  vpc_id = "${aws_vpc.kubernetes-r7v-de.id}"

  tags = {
    KubernetesCluster = "kubernetes.r7v.de"
    Name              = "kubernetes.r7v.de"
  }
}

resource "aws_key_pair" "kubernetes-kubernetes-r7v-de-78ada5e8e4b062ee3e8899fdabb30e9c" {
  key_name   = "kubernetes.kubernetes.r7v.de-78:ad:a5:e8:e4:b0:62:ee:3e:88:99:fd:ab:b3:0e:9c"
  public_key = "${file("${path.module}/data/aws_key_pair_kubernetes.kubernetes.r7v.de-78ada5e8e4b062ee3e8899fdabb30e9c_public_key")}"
}

resource "aws_launch_configuration" "master-us-east-1a-masters-kubernetes-r7v-de" {
  name_prefix                 = "master-us-east-1a.masters.kubernetes.r7v.de-"
  image_id                    = "ami-b2137ea4"
  instance_type               = "m3.medium"
  key_name                    = "${aws_key_pair.kubernetes-kubernetes-r7v-de-78ada5e8e4b062ee3e8899fdabb30e9c.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.masters-kubernetes-r7v-de.id}"
  security_groups             = ["${aws_security_group.masters-kubernetes-r7v-de.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_master-us-east-1a.masters.kubernetes.r7v.de_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = true
  }

  ephemeral_block_device = {
    device_name  = "/dev/sdc"
    virtual_name = "ephemeral0"
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_launch_configuration" "nodes-kubernetes-r7v-de" {
  name_prefix                 = "nodes.kubernetes.r7v.de-"
  image_id                    = "ami-b2137ea4"
  instance_type               = "t2.medium"
  key_name                    = "${aws_key_pair.kubernetes-kubernetes-r7v-de-78ada5e8e4b062ee3e8899fdabb30e9c.id}"
  iam_instance_profile        = "${aws_iam_instance_profile.nodes-kubernetes-r7v-de.id}"
  security_groups             = ["${aws_security_group.nodes-kubernetes-r7v-de.id}"]
  associate_public_ip_address = true
  user_data                   = "${file("${path.module}/data/aws_launch_configuration_nodes.kubernetes.r7v.de_user_data")}"

  root_block_device = {
    volume_type           = "gp2"
    volume_size           = 20
    delete_on_termination = true
  }

  lifecycle = {
    create_before_destroy = true
  }
}

resource "aws_route" "0-0-0-0--0" {
  route_table_id         = "${aws_route_table.kubernetes-r7v-de.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.kubernetes-r7v-de.id}"
}

resource "aws_route_table" "kubernetes-r7v-de" {
  vpc_id = "${aws_vpc.kubernetes-r7v-de.id}"

  tags = {
    KubernetesCluster = "kubernetes.r7v.de"
    Name              = "kubernetes.r7v.de"
  }
}

resource "aws_route_table_association" "us-east-1a-kubernetes-r7v-de" {
  subnet_id      = "${aws_subnet.us-east-1a-kubernetes-r7v-de.id}"
  route_table_id = "${aws_route_table.kubernetes-r7v-de.id}"
}

resource "aws_security_group" "masters-kubernetes-r7v-de" {
  name        = "masters.kubernetes.r7v.de"
  vpc_id      = "${aws_vpc.kubernetes-r7v-de.id}"
  description = "Security group for masters"

  tags = {
    KubernetesCluster = "kubernetes.r7v.de"
    Name              = "masters.kubernetes.r7v.de"
  }
}

resource "aws_security_group" "nodes-kubernetes-r7v-de" {
  name        = "nodes.kubernetes.r7v.de"
  vpc_id      = "${aws_vpc.kubernetes-r7v-de.id}"
  description = "Security group for nodes"

  tags = {
    KubernetesCluster = "kubernetes.r7v.de"
    Name              = "nodes.kubernetes.r7v.de"
  }
}

resource "aws_security_group_rule" "all-master-to-master" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetes-r7v-de.id}"
  source_security_group_id = "${aws_security_group.masters-kubernetes-r7v-de.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-master-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kubernetes-r7v-de.id}"
  source_security_group_id = "${aws_security_group.masters-kubernetes-r7v-de.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "all-node-to-node" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.nodes-kubernetes-r7v-de.id}"
  source_security_group_id = "${aws_security_group.nodes-kubernetes-r7v-de.id}"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
}

resource "aws_security_group_rule" "https-external-to-master-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.masters-kubernetes-r7v-de.id}"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "master-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.masters-kubernetes-r7v-de.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-egress" {
  type              = "egress"
  security_group_id = "${aws_security_group.nodes-kubernetes-r7v-de.id}"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "node-to-master-tcp-1-4000" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetes-r7v-de.id}"
  source_security_group_id = "${aws_security_group.nodes-kubernetes-r7v-de.id}"
  from_port                = 1
  to_port                  = 4000
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-tcp-4003-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetes-r7v-de.id}"
  source_security_group_id = "${aws_security_group.nodes-kubernetes-r7v-de.id}"
  from_port                = 4003
  to_port                  = 65535
  protocol                 = "tcp"
}

resource "aws_security_group_rule" "node-to-master-udp-1-65535" {
  type                     = "ingress"
  security_group_id        = "${aws_security_group.masters-kubernetes-r7v-de.id}"
  source_security_group_id = "${aws_security_group.nodes-kubernetes-r7v-de.id}"
  from_port                = 1
  to_port                  = 65535
  protocol                 = "udp"
}

resource "aws_security_group_rule" "ssh-external-to-master-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.masters-kubernetes-r7v-de.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh-external-to-node-0-0-0-0--0" {
  type              = "ingress"
  security_group_id = "${aws_security_group.nodes-kubernetes-r7v-de.id}"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_subnet" "us-east-1a-kubernetes-r7v-de" {
  vpc_id            = "${aws_vpc.kubernetes-r7v-de.id}"
  cidr_block        = "172.20.32.0/19"
  availability_zone = "us-east-1a"

  tags = {
    KubernetesCluster                         = "kubernetes.r7v.de"
    Name                                      = "us-east-1a.kubernetes.r7v.de"
    "kubernetes.io/cluster/kubernetes.r7v.de" = "owned"
  }
}

resource "aws_vpc" "kubernetes-r7v-de" {
  cidr_block           = "172.20.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    KubernetesCluster                         = "kubernetes.r7v.de"
    Name                                      = "kubernetes.r7v.de"
    "kubernetes.io/cluster/kubernetes.r7v.de" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "kubernetes-r7v-de" {
  domain_name         = "ec2.internal"
  domain_name_servers = ["AmazonProvidedDNS"]

  tags = {
    KubernetesCluster = "kubernetes.r7v.de"
    Name              = "kubernetes.r7v.de"
  }
}

resource "aws_vpc_dhcp_options_association" "kubernetes-r7v-de" {
  vpc_id          = "${aws_vpc.kubernetes-r7v-de.id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.kubernetes-r7v-de.id}"
}

terraform = {
  required_version = ">= 0.9.3"
}

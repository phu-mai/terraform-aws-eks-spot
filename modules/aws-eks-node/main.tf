locals {
  eks-node-userdata = <<USERDATA
#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${var.endpoint}' --b64-cluster-ca '${var.certificate_authority}' '${var.name}'
USERDATA
  name_prefix = "${var.name}-node-${var.node_config["name"]}-"
}

data "aws_ami" "eks-cluster" {
  filter {
    name   = "name"
    values = ["amazon-eks-node-${var.eks_version}-v*"]
  }

  most_recent = true
  owners      = ["602401143452"] # Amazon EKS AMI Account ID
}
# EKS currently documents this required userdata for EKS worker nodes to
# properly configure Kubernetes applications on the EC2 instance.
# We utilize a Terraform local here to simplify Base64 encoding this
# information into the AutoScaling Launch Configuration.
# More information: https://docs.aws.amazon.com/eks/latest/userguide/launch-workers.html


resource "aws_launch_template" "eks-node" {
  count                       = "${var.create_node}"
  image_id                    = "${data.aws_ami.eks-cluster.id}"
  user_data                   = "${base64encode(local.eks-node-userdata)}"
  name_prefix                 = "${local.name_prefix}"
  instance_type               = "${var.node_config["ec2_type_1"]}"
  
  network_interfaces {
    associate_public_ip_address = true
    security_groups = ["${var.security_groups}"]
  }

  iam_instance_profile {
    arn = "${var.iam_instance_profile}"
  }

  lifecycle {
    create_before_destroy = true

    # Ignore changes in the AMI which force recreation of the resource. This
    # avoids accidental deletion of nodes whenever a new CoreOS Release comes
    # out.
    ignore_changes = ["image_id"]
  }
}

resource "aws_autoscaling_group" "eks-node" {
  name_prefix          = "Autoscaling-${var.node_config["name"]}-"
  max_size             = "${var.node_config["instance_count"] * 3}"
  min_size             = "${var.node_config["instance_count"]}"
  desired_capacity     = "${var.node_config["instance_count"]}"
  vpc_zone_identifier  = ["${var.vpc_zone_identifier}"]
  load_balancers       = ["${var.load_balancer_ids}"]
  target_group_arns    = ["${var.target_group_arns}"]
  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = "${aws_launch_template.eks-node.id}"
        version = "$$Latest"
      }

      override {
        
        instance_type = "${var.node_config["ec2_type_1"]}"
      }

      override {
        instance_type = "${var.node_config["ec2_type_2"]}"
      }
    }
    instances_distribution {
      on_demand_base_capacity                  = "${var.node_config["on_demand_base_capacity"]}"
      on_demand_percentage_above_base_capacity = "${var.node_config["on_demand_percentage_above_base_capacity"]}"
      spot_instance_pools                      = "${var.node_config["spot_instance_pools"]}"
    }
  }

  tag {
    key                 = "Name"
    value               = "${local.name_prefix}"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${var.name}"
    value               = "owned"
    propagate_at_launch = true
  }
}

resource "aws_security_group" "nlb" {
  name        = "${var.project_name}-nlb"
  description = "Public HTTP access to the EKS reverse-proxy NLB"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Public HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description     = "Forward traffic and health checks to EKS worker NodePorts"
    from_port       = 30000
    to_port         = 32767
    protocol        = "tcp"
    security_groups = [aws_eks_cluster.main.vpc_config[0].cluster_security_group_id]
  }

  tags = merge(local.common_tags, {
    Name = "${var.project_name}-nlb"
  })
}

resource "aws_vpc_security_group_ingress_rule" "nlb_to_nodes" {
  security_group_id            = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
  referenced_security_group_id = aws_security_group.nlb.id
  description                  = "Allow the public NLB to reach EKS worker NodePorts"
  from_port                    = 30000
  to_port                      = 32767
  ip_protocol                  = "tcp"
}

resource "aws_security_group" "cluster" {
    name        = "cluster"
    description = "EKS Security Group"
    vpc_id      = aws_vpc.main.id

    egress {
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {}
}

resource "aws_security_group_rule" "node" {
    type              = "egress"
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = [""]
}

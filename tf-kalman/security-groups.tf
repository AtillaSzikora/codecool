# Resource Security Group
resource "aws_security_group" "kalman_LB_SG" {
    name = "kalman_LB_SG"
    description = "Security Group for the Load Balancer"
    vpc_id = aws_vpc.kalman_vpc.id

    tags = { Name = "Kalman-LB-SG" }
}

#Resource Security Group
resource "aws_security_group" "kalman_app_SG" {
    name = "kalman_app_SG"
    description = "Security Group for the Application"
    vpc_id = aws_vpc.kalman_vpc.id

    tags = { Name = "Kalman-app-SG" }
}

# Resource Security Group Ingress Rule
resource "aws_security_group_ingress_rule" "kalman_LB_SG_in_rule1" {
    security_group_id = aws_security_group.kalman_LB_SG.id
    ip_protocol = "http"
    from_port = 80
    cidr_ipv4 = "0.0.0.0/0"

    tags = { Name = "Kalman-LB-SG-in-rule-http" }
}

# Resource Security Group Ingress Rule
resource "aws_security_group_ingress_rule" "kalman_LB_SG_in_rule2" {
    security_group_id = aws_security_group.kalman_LB_SG.id
    ip_protocol = "https"
    from_port = 443
    cidr_ipv4 = "0.0.0.0/0"

    tags = { Name = "Kalman-LB-SG-in-rule-https" }
}

# Resource Security Group Ingress Rule
resource "aws_security_group_ingress_rule" "kalman_app_SG_in_rule1" {
    security_group_id = aws_security_group.kalman_app_SG.id
    ip_protocol = "http"
    from_port = 80
    cidr_ipv4 = aws_security_group.kalman_LB_SG.ingress[0].cidr_ipv4
}

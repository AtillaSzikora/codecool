# MAster Node
resource "aws_eks_cluster" "this" {
    name = "csksession"
    role_arn = "aws_iam_role.cluster.arn"
    version = "1.37"

    vpc_config {
        subnet_ids = []
        security_group_ids = []
        endpoint_private_access = true
        endpoint_public_access = true
        public_access_cidrs = ["0.0.0.0/0"]
    }


    depends_on = [
        aws_iam_role_policy_attachment.cluster_AmazonEKSClusterPolicy,
        aws_iam_role_policy_attachment.cluster_AmazonEKSVPCResourceController   
    ]

    tags = { Name = "csksession" }
}

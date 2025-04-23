from diagrams import Diagram, Cluster, Edge
from diagrams.aws.compute import EC2
from diagrams.aws.network import VPC, PublicSubnet, InternetGateway
from diagrams.aws.storage import S3
from diagrams.aws.security import IAM


with Diagram("AWS EC2 with S3 Access (Simplified Demo)", show=False, direction="LR", filename="terraform_aws_demo_diagram.png"):

    s3_bucket = S3("terraform-demo-bucket")

    iam_role = IAM("IAM Role\n(EC2 S3 Access)")

    with Cluster("AWS Cloud"):
        with Cluster("VPC (main-vpc-demo)"):
            igw = InternetGateway("IGW")

            with Cluster("Public Subnet (public-subnet-demo)"):
                ec2_instance = EC2("web-server-demo")

            ec2_instance - Edge(label="uses role") - iam_role
            ec2_instance - Edge(label="routes via") - igw

    iam_role - Edge(label="grants access to") - s3_bucket
    igw - Edge(label="Public Internet / S3 Endpoint") - s3_bucket
    
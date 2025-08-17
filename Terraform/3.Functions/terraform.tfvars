aws_region = "ap-south-1"
vpc_cidr   = "10.1.0.0/16"
public_subnet_cidrs = [
  "10.1.1.0/24",
  "10.1.2.0/24",
  "10.1.3.0/24",
  "10.1.1.0/24",
  "10.1.2.0/24",
  "10.1.3.0/24"
]
private_subnet_cidrs = [
  "10.1.10.0/24",
  "10.1.20.0/24",
  "10.1.30.0/24",
  "10.1.10.0/24",
  "10.1.20.0/24",
  "10.1.30.0/24"
]
azs = [
  "ap-south-1a",
  "ap-south-1b",
  "ap-south-1c"
]
ingress_ports = [22, 80, 443, 3389, 3306, 22, 80, 443, 3389, 3306]
egress_ports  = [80, 443, 80, 443, 80, 443]
vpc_name      = "AwsDevops43"
key_name      = "Remote"
environment   = "dev"
imagename = {
  "ap-south-1" = "ami-0e35ddab05955cf57"
  "us-east-2"  = "ami-04f167a56786e4b09"
}
owner         = "DynoRamp"
instance_type = "t3.micro"
appversion    = "1.0.0.2"
region   = "us-east-1"
vpc_cidr = "10.0.0.0/16"

public_subnets = [
  { name = "Public subnet 1", cidr = "10.0.1.0/24", az = "us-east-1a" },
  { name = "Public subnet 2", cidr = "10.0.2.0/24", az = "us-east-1b" }
]

private_subnets = [
  { name = "Private subnet 1", cidr = "10.0.3.0/24", az = "us-east-1a" },
  { name = "Private subnet 2", cidr = "10.0.4.0/24", az = "us-east-1b" }
]

instance_types = ["t3.small", "t3.medium", "t3.large"]

instance_name_mapping = {
  "t3.small"  = "Small Instance"
  "t3.medium" = "Medium Instance"
  "t3.large"  = "Large Instance"
}

# Lab M4.07 - Terraform AWS Networking

## What I built
Multi-AZ VPC with three subnet tiers, same architecture you'd use in production
but deployed with Terraform instead of clicking around in the console.

## Infrastructure
- VPC: 10.0.0.0/16 across 3 availability zones
- 3 public subnets (for load balancers)
- 3 private subnets (for app servers)
- 3 database subnets (isolated, no internet access)
- Internet Gateway
- 1 NAT Gateway (configurable to 3 for prod)
- Route tables for each tier

## Architecture

AZ-A              AZ-B              AZ-C
├─ Public         ├─ Public         ├─ Public
├─ Private        ├─ Private        ├─ Private
└─ Database       └─ Database       └─ Database

## Deploy

Single NAT (dev):
terraform apply -var="single_nat_gateway=true"

Multi-AZ NAT (prod):
terraform apply -var="single_nat_gateway=false"

## Testing
Run test-connectivity.sh to verify VPC, subnets, NAT Gateway
and route tables are correctly configured.

## Manual vs Terraform
Doing this manually in the AWS console took me around 45 minutes the first time.
With Terraform its done in 5 minutes and I can repeat it anytime.
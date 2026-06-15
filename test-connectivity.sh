#!/bin/bash

VPC_ID=$(terraform output -raw vpc_id)

echo "=== VPC Details ==="
aws ec2 describe-vpcs --vpc-ids $VPC_ID \
  --query 'Vpcs[*].[VpcId,CidrBlock,State]' \
  --output table

echo ""
echo "=== Subnet Count ==="
aws ec2 describe-subnets --filters "Name=vpc-id,Values=$VPC_ID" \
  --query 'Subnets[*].[Tags[?Key==`Name`].Value|[0],CidrBlock,AvailabilityZone]' \
  --output table

echo ""
echo "=== NAT Gateways ==="
aws ec2 describe-nat-gateways --filter "Name=vpc-id,Values=$VPC_ID" \
  --query 'NatGateways[*].[NatGatewayId,State,SubnetId]' \
  --output table

echo ""
echo "=== Route Tables ==="
aws ec2 describe-route-tables --filters "Name=vpc-id,Values=$VPC_ID" \
  --query 'RouteTables[*].[RouteTableId,Tags[?Key==`Name`].Value|[0]]' \
  --output table
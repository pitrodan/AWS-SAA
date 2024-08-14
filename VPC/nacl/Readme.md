 ## Get VPC Id from the VPC Name

```sh
aws ec2 describe-vpcs \
--filters "Name=tag:Name,Values=nacl-eg-vpc" \
--query "Vpcs[].VpcId" \
--output text
```

## Create NACL based on the id

```sh
aws ec2 create-network-acl \
--vpc-id vpc-07ac02227c97abb08

```
```sh
aws s3api create-bucket acl-np-9297
```
## Turn off block public access for acls

```sh
aws s3api put-public-access-block \
    --bucket acl-np-9297 \
    --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```
## public-access block

```sh
aws s3api get-public-access-block \
--bucket acl-np-9297
```

## change bucket owner to modify ACLs through console (by def its enforced)

aws s3api put-bucket-ownership-controls \
    --bucket acl-np-9297 \
    --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"

## find conolical id of your account 
## obtain this id for the account you want to give permission to 
aws s3api list-buckets \
    --query Owner.ID \
    --output text


## change ACls to allow for another AWS acoount
## not running this commamd because I dont have another Aws account
aws s3api put-bucket-acl \
--bucket acl-np-9297
--access-control-policy="file:///workspace/AWS-SAA/S3/ACLs/policy.json"

## access bucket from other account
aws s3 ls s3://acl-np-9297
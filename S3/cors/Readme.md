## Create Website 1

```sh
aws s3 mb s3://cors-np-89848
```
## Change public block access

```sh
aws s3api put-public-access-block \
    --bucket cors-np-89848 \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket cors-np-89848 --policy file:///workspace/AWS-SAA/S3/cors/policy.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket cors-np-89848 --website-configuration file:///workspace/AWS-SAA/S3/cors/website.json
```


## Upload our index.html file and include a resource that would be cross-origin

```sh
aws s3 cp index.html s3://cors-np-89848
```

## View the website and see if there

http://cors-np-89848.s3-website.ca-central-1.amazonaws.com

## Create Website 2

```sh
aws s3 mb s3://cors-2-np-89848
```
## Change public block access

```sh
aws s3api put-public-access-block \
    --bucket cors-2-np-89848 \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket cors-2-np-89848 --policy file:///workspace/AWS-SAA/S3/cors/policy2.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket cors-2-np-89848 --website-configuration file:///workspace/AWS-SAA/S3/cors/website.json
```


## Upload our javascript file

```sh
aws s3 cp hello.js s3://cors-2-np-89848
```

## Create API Gateway with mock response and then test the endpoint

curl -X POST -H "Content-Type: application/json" https://cl4l3n0za5.execute-api.ca-central-1.amazonaws.com/prod/hello

## We got the cors error we now gonna create a cors policy

## Set cors for our bucket

aws s3api put-bucket-cors --bucket cors-2-np-89848 --cors-configuration file://cors.json














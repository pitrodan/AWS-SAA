## Create a user with no permisiion and generate out access keys

```sh

aws iam create-user --user-name sts-temp-user

aws iam create-access-key \
--user-name sts-temp-user \
--output table
```

## Copy the access key and sceret here

```sh
aws configure
```

## Then edit the credentials file to change the default profile

```sh
open ~/.aws/credentials
```

## Test who you are 

```sh
aws sts get-caller-identity
```

## After editing the file

```sh
aws sts get-caller-identity --profile sts
```

>{
    "UserId": "AIDAU6GDXDMDEVVR2SVEY",
    "Account": "339712875270",
    "Arn": "arn:aws:iam::339712875270:user/sts-temp-user"
}


## make sure you do not have access to s3

```sh
aws s3 ls --profile sts
```

>An error occurred (AccessDenied) when calling the ListBuckets operation: Access Denied


## Create a Role that will access a new resource

```sh
chmod u+x bin/deploy
./bin/deploy
```

## use new credentials and assume role

## We also have to give credentials to the user to access to it so that we are puting an inline policy 

```sh
aws iam put-user-policy \
    --user-name sts-temp-user \
    --policy-name StsAssumePolicy \
    --policy-document file://policy.json
```

## This will throw error to give permission so that we have to use above command to give permision
```sh
aws sts assume-role \
    --role-arn arn:aws:iam::339712875270:role/my-sts-fun-stack-StsRole-ZHf78eXiH0Am \
    --role-session-name s3-sts-fun
    --profile sts 
```
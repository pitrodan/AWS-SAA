```sh
aws s3 mb s3://bucket-policy-np-8029
```

## 
```sh
aws s3api put-bucket-policy --bucket bucket-policy-np-8029 --policy file://policy.json
```
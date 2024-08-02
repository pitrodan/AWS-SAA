```sh
aws s3 mb s3://storage-class-np-789792
```

```sh
echo "hello World" > hello.txt
```
## change storage class
```sh
aws s3 cp hello.txt s3://storage-class-np-789792 --storage-class STANDARD_IA
```

## get storage class
```sh
aws s3api list-objects-v2 --bucket storage-class-np-789792 --prefix hello.txt --query "Contents[*].StorageClass" --output text
```

```sh
aws s3 mb s3://encryption-np-7988
```

## Create a File

echo "Hello World!" > hello.txt

```sh
aws s3 cp hello.txt s3://encryption-np-7988
```

## Put object with encrytion

```sh
aws s3api put-object \
--bucket encryption-np-7988 \
--key hello.txt \
--body hello.txt \
--server-side-encryption aws:kms \

```


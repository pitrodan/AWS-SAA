```sh
aws s3 mb s3://metadata-np-72682
```

```sh
echo "Hello Nishit" > hello.txt
```

```sh
aws s3api put-object --bucket metadata-np-72682 --key hello.txt --body hello.txt --metadata Name=Nishit
```

```sh
aws s3api head-object --bucket metadata-np-72682 --key hello.txt 
```
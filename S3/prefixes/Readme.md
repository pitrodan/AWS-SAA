```sh
aws s3 mb s3://prefixes-np-72682
```
```sh
 aws s3api put-object --bucket prefixes-np-72682 --key "hello/"
```
```sh
You can only create prefixes upto  limit of 1024 bytes
```
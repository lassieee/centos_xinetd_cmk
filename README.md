# Just testing

## build x86_64 image(s) on M1 mac
```bash
for i in 7 8
  do docker buildx build --platform linux/amd64 --load --file Dockerfile_CentOS${i} --tag centos_xinetd_cmk:${i} .
done
```

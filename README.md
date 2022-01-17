# Just testing


## Build x86_64 image(s) on M1 mac
```bash
for version in 7 8
  do docker buildx build --platform linux/amd64 --load --file Dockerfile_CentOS${version} --tag centos_xinetd_cmk:${version} .
done
```


Build status:  
[![Docker Repository on Quay](https://quay.io/repository/lcasper/centos7_xinetd_cmk/status "Docker Repository on Quay")](https://quay.io/repository/lcasper/centos7_xinetd_cmk)

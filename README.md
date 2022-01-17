# test 

## build x86_64 image on M1 mac
docker buildx build --platform linux/amd64 --load --build-arg version=7 -t centos_xinetd_cmk:7 .

# eos_docker

## RUN docker 
```
docker run -d -it -p 8887:8080/tcp -p 8886:19999/tcp --name eos tony92151/eos_lab
```

Go to http://localhost:8887 and login with Password below in terminal

## Docker build

```
cd /Path to docker file/Dockerfile
docker build -t tony92151/eostest2 .
docker login && docker push tony92151/eostest2
```

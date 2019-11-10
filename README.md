# eos_docker

## RUN docker 
```
docker run -d -it -p 8887:8080/tcp --name eos tony92151/eos_lab
docker exec -it eos ./code-server2.1688-vsc1.39.2-linux-x86_64/code-server
```

Go to http://localhost:8887 and login with Password below in terminal

## Docker build

```
cd /Path to docker file/Dockerfile
docker build -t tony92151/eostest2 .
docker login && docker push tony92151/eostest2
```

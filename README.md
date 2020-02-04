# eos_docker

## Version

EOSIO v2.0.0

eosio.cdt v1.6.1

## RUN docker 
```
docker run -d -it -p 8887:8080/tcp -p 8886:19999/tcp --name eos tony92151/eos_lab:v2
```

Go to http://localhost:8887 and login with Password "eospc"

<img src="https://github.com/Intelligent-Systems-Lab/eos_docker/raw/master/images/docker_vscode.png" width="640"/>


## Docker build

```
cd /Path to docker file/Dockerfile
docker build -t tony92151/eos_lab:v2 .
docker login && docker push tony92151/eos_lab:v2
```

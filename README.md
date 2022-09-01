# d-eyaml

Dockerfile and tooling to run hiera-eyaml from a docker container

## build docker imagea and push to docker hub

```bash
docker build -t d-eyaml .
docker images | grep d-eyaml
docker tag d77a16951c49 lefju418/d-eyaml:v1.0
docker login --username=lefju418
docker push lefju418/d-eyaml:v1.0
docker push lefju418/d-eyaml
```

## sample script using the image

place `d-eyaml-edit.bash` in your path and allow execution.

`d-eyaml-edit.bash a_file.eyaml` is an equivalent of `eyaml edit a_file.eyaml` using a docker deployment of hiera-eyaml

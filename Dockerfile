# syntax=docker/dockerfile:1
# build command: docker build -t lefju/d-eyaml .
FROM alpine:3.16.2
RUN apk add --update --no-cache ruby && gem install --no-force hiera-eyaml
ENTRYPOINT ["eyaml"]

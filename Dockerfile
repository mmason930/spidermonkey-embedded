FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install g++ make libmozjs-91-0 libmozjs-91-dev -y
ADD src /src
ADD docker-start.sh /docker-start.sh
WORKDIR /src

ENTRYPOINT ["/docker-start.sh"]
